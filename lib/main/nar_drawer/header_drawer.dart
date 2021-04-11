import 'package:fai_kul/main.dart';
import 'package:fai_kul/main/main_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget createDrawerHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image:  AssetImage('assets/images/blue_bg.jpg'))),
      child: Stack(children: <Widget>[
        Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage("assets/images/kidkul_logo.png"),
                ),
                SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Text("${getCurrentUser().displayName}",
                     style: TextStyle(  
                         color: Colors.white,
                         fontSize: 25.0,
                         fontWeight: FontWeight.w500)),
                 Text('${getCurrentUser().roleName}',
                     style: TextStyle(
                         color: Colors.white,
                         fontSize: 10.0,
                         fontWeight: FontWeight.w500))
               ],
              )
              ],
            )),
      ]));
}