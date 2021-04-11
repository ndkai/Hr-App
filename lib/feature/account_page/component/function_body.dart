import 'package:fai_kul/main/main_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class FunctionBody extends StatelessWidget {
  final double itemsSize = 20;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // appUser = getCurrentUser();
    print("lolol ${appUser.roleName}");
    print("lolol ${appUser.idNhanVien}");
    return Container(
      margin: EdgeInsets.fromLTRB(20, size.height * 0.23, 20, 0),
      height: size.height * 0.6,
      width: size.width,
      color: Colors.transparent,
      child: Column(
        children: [
          functionItem(size, appUser.roleName,"gmail_icon"),
          Divider(height: 2, color: Colors.black,),
          functionItem(size, "darkspirit909@gmail.com","gmail_icon"),
          Divider(height: 2, color: Colors.black,),
          functionItem(size, "0946706143","gmail_icon"),
          Divider(height: 2, color: Colors.black,),
          functionItem(size, "Chức năng","gmail_icon"),
          Divider(height: 2, color: Colors.black,),
          functionItem(size, "Chức năng","gmail_icon"),
          Divider(height: 2, color: Colors.black,),
        ],
      ),
    );
  }

  Widget functionItem(Size size, String name,String image){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          nameTag(name,image),
         Container(
           child:  Align(
             alignment: FractionalOffset.centerRight,
             child: Icon(Icons.arrow_forward_ios_rounded),
           ),
         )
        ],
      ),
    );
  }

   Widget nameTag(String name, String image){
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/icons/${image}.png"),
          ),
          SizedBox(width: 20,),
          Text(name, style: TextStyle(fontSize: itemsSize),) ,
        ],
      )
    );
   }
}
