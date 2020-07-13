import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:photohub/model/wallpapermodel.dart';
import 'package:photohub/widget/widget.dart';
import 'package:http/http.dart' as http;

import '../data.dart';
class search extends StatefulWidget {
 final String searchstring;

  const search({ this.searchstring}) ;

  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  List<wallpapermodel>wallpapers  = new List();
//  String apikey ="563492ad6f91700001000001de47bbb613fe43af9dcbe96be4e2bd0d";
  TextEditingController seacrhcontroller = new TextEditingController();
  getsearch(String Querry) async {
    var responses= await http.get("https://api.pexels.com/v1/search?query=$Querry&per_page=15&page=1",
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
  @override
  void initState() {
   getsearch(widget.searchstring);
    super.initState();
    seacrhcontroller.text=widget.searchstring;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BrandName(),
        elevation:0.0 ,
      ),
      body: SingleChildScrollView(
        child: Container(
           child: Column(
             children: <Widget>[
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
                             setState(() {
                               getsearch(seacrhcontroller.text);
                             });

                           },
                           child: Icon(Icons.search))
                     ]),
               ),
               SizedBox(height: 16,),
               wallpaperslist(wallpapers : wallpapers,context: context),
             ],
           ),
        ),
      ),
    );

  }
}
