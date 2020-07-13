import 'package:fluttertoast/fluttertoast.dart';
import 'dart:typed_data';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import 'package:permission_handler/permission_handler.dart';

class imgvie extends StatefulWidget {
  final String imgurl;

  imgvie({@required this.imgurl}) ;
  @override
  _imgvieState createState() => _imgvieState();
}

class _imgvieState extends State<imgvie> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[

        Hero(
          tag: widget.imgurl,
          child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,

              child: Image.network(widget.imgurl, fit: BoxFit.cover,)),
        ),
        Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                onTap: () async {
                  getPermission();
                  var response = await Dio().get(widget.imgurl,
                      options: Options(responseType: ResponseType.bytes));
                  final result =
                  await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
                  print(result);

                  Navigator.pop(context);
                  Fluttertoast.showToast(
                      msg: "Image Downloaded sucessfully",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIos: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );

                },
                child: Stack(
                  children: [
                    Container(
                      height: 50,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 2,
                      color: Color(0xffc1b1b),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 2,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white54, width: 1),
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                              colors: [
                                Color(0x36ffffff),
                                Color(0x0fffffff),
                              ]
                          )
                      ),
                      child: Column(children: [
                        Text("Set Wallpaper", style: TextStyle(
                            fontSize: 16, color: Colors.white70),),
                        Text("Image will be saved in gallery", style: TextStyle(
                            fontSize: 12, color: Colors.white70),),
                      ],


                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel", style: TextStyle(color: Colors.white),)),
              SizedBox(height: 50,)
            ],),
        ),
      ],),
    );
  }
  void getPermission() async {
    Map<PermissionGroup, PermissionStatus> permissions;

    permissions = await PermissionHandler().requestPermissions([

      PermissionGroup.storage,

    ]);
  }
   }




