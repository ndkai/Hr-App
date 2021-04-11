
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> imageList =  ['tk_bg1.png','tk_bg2.jpg','bg1.jpg',];
List<Widget> _map<Widget>(List list, Function handle){
  List<Widget> result = [];
for(var i = 0; i < list.length; i++ ){
//result thêm các phần tử mà func handle trả về
result.add(handle(i,list[i]));
}
return result;
}


final List<Widget> child= _map<Widget>(imageList,/* đây là func*/ (index, String assetName){
  return Container(
      child: Image.asset('assets/images/$assetName', fit: BoxFit.fitWidth),
      color: Colors.black,
  );

}).toList();
