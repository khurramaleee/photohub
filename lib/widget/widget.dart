import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photohub/model/wallpapermodel.dart';
import 'package:photohub/views/home.dart';
import 'package:photohub/views/imgvie.dart';
Widget BrandName(){
  return RichText(
    text: TextSpan(

      style:TextStyle(fontSize: 16),
      children: <TextSpan>[
        TextSpan(text: 'Photo ', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
        TextSpan(text: 'Hub', style: TextStyle(color: Colors.blue,fontWeight:FontWeight.bold)),

      ],
    ),
  );
}
Widget wallpaperslist({List<wallpapermodel>wallpapers,context}){
  categorytile cc;
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount:2,
    childAspectRatio: 0.6,
     mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallpaper) {
return Stack(
    children: [
      GridTile(

        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=> imgvie(
                imgurl: wallpaper.src.protrait,
              ),
            ));
          },
          child: Hero(
            tag: wallpaper.src.protrait,
            child: Container(

              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(wallpaper.src.protrait,fit: BoxFit.cover,)),
            ),

          ),
        ),


      ),
      Center(
        child: Container(child: Text("Captured By: "+wallpaper.photographer,style: TextStyle(
            fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold)),),
      ),
    ],
);
      }
      ).toList(),

    ),
  );
}