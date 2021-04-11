import 'package:fai_kul/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CircleAvatar(
            radius: 40.0,
            backgroundImage: AssetImage("assets/images/titkul_logo.jpg"),
          ),
          SizedBox(height: 10,),
          Text(appUser.displayName==null?appUser.displayName:"NoName", style: TextStyle(fontSize: 20,color: Colors.white),),
        ],
      )
    );
  }
}
