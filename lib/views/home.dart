import 'dart:convert';
import 'package:loading/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photohub/data.dart';
import 'package:photohub/model/catmodel.dart';
import 'package:photohub/model/wallpapermodel.dart';
import 'package:photohub/views/category.dart';
import 'package:photohub/views/imgvie.dart';
import 'package:photohub/views/search.dart';
import 'package:photohub/widget/widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
class home extends StatefulWidget{
  _homeState createState()=> _homeState();

}
class _homeState extends State<home>{
  List <catmodel> categories  = new List();
  List<wallpapermodel>wallpapers  = new List();
  TextEditingController seacrhcontroller = new TextEditingController();
  gettraending() async {
    var responses= await http.get("https://api.pexels.com/v1/curated?per_page=15&page=1",
    headers: {
      "Authorization": apikey});

Map<String,dynamic> jsondata = jsonDecode(responses.body);

jsondata["photos"].forEach((element){
wallpapermodel walmodel = new wallpapermodel();
walmodel = wallpapermodel.fromMap(element);
wallpapers.add(walmodel);
});
setState(() {

});
  }
  int noOfImageToLoad = 30;
  ScrollController _scrollController = new ScrollController();
  @override
  void initState() {
    categories = getcat();
    gettraending();
    super.initState();
    seacrhcontroller.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        noOfImageToLoad = noOfImageToLoad + 300;
      setState(() {
        gettraending();
      });
      }
    });
  }
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white ,
      appBar: AppBar(
  title: BrandName(),
        elevation:0.0 ,
      ),
      body: Container(


        child: SingleChildScrollView(
          child: Container(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(

                      color: Color(0xfff5f8fd),
                      borderRadius: BorderRadius.circular(30)

                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: seacrhcontroller,
                            decoration: InputDecoration(

                              hintText: "search",
                              border: InputBorder.none

                            ),
                          ),
                        ),
                        InkWell(
                          onTap:(){
  Navigator.push(context, MaterialPageRoute(
    builder: (context)=>search(
searchstring:seacrhcontroller.text,
    ),
  ));
                            },
                            child: Icon(Icons.search))
                      ]),
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Made By ",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontFamily: 'Overpass'),
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchURL("https://www.instagram.com/iamkhurramalee");
                        },
                        child: Container(
                            child: Text(
                              "khurram Softwares",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 12,
                                  fontFamily: 'Overpass'),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Container(
                    height: 80,
                    child: ListView.builder(itemCount:categories.length,
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
//                  wallpapers[index].src.protrait;
                      return categorytile(

                        title: categories[index].Catname,
                        imgurl: categories[index].imgurl,
                      );
                        }),
                  ),
                  wallpaperslist(wallpapers : wallpapers,context: context),
                  SizedBox(height: 16,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Photos provided by  ",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontFamily: 'Overpass'),
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchURL("https://www.pexels.com");
                        },
                        child: Container(
                            child: Text(
                              "Pexels",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                  fontFamily: 'Overpass'),
                            )),

                      ),
                      SizedBox(height: 25,),
                    ],
                  ),
                ],
              ),

          ),

        ),
      ),


    );
  }
}
class categorytile extends StatelessWidget {
   final String imgurl,title;

  categorytile({@required this.imgurl, @required this.title}) ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=>category(
            catt: title.toLowerCase(),
          ),
        ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 8),
        child: Stack(children: <Widget>[

          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(imgurl,height: 50,width: 100,fit: BoxFit.cover,),

      ),


          Container(
decoration: BoxDecoration(

  borderRadius:  BorderRadius.circular(16),
),
            height: 50,
      width: 100,
            alignment: Alignment.center,
            child:
            Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),) ,
          ),
        ]),
      ),
    );
  }
}
