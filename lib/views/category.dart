import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:photohub/model/wallpapermodel.dart';
import 'package:photohub/widget/widget.dart';

import '../data.dart';
class category extends StatefulWidget {
  final String catt;

category({ this.catt}) ;
  @override
  _categoryState createState() => _categoryState();
}

class _categoryState extends State<category> {

  List<wallpapermodel>wallpapers  = new List();
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
    getsearch(widget.catt);
    // TODO: implement initState
    super.initState();
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

              SizedBox(height: 16,),
              wallpaperslist(wallpapers : wallpapers,context: context),
            ],
          ),
        ),
      ),
    );

  }
}
