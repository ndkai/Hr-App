import 'package:fai_kul/main/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  final MaterialColor color;
  const CustomCard({
    Key key,
    this.image,
    this.title,
    this.isActive = false, this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.fromLTRB(size.height/70,0,size.height/70,0),
      height: size.width * 0.4,
      width: size.width* 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
        boxShadow: [
          isActive
              ? BoxShadow(
            offset: Offset(0, size.height/50),
            blurRadius: 20,
            color: kActiveShadowColor,
          )
              : BoxShadow(
            offset: Offset(0, 3),
            blurRadius: 6,
            color: kShadowColor,
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          Container(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Image.asset(image, height: size.width*0.3 ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child:   Text("$title", style: TextStyle(color: Colors.white, fontSize: size.width * 0.05, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}

class CustomCard2 extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  final MaterialAccentColor color;
  const CustomCard2({
    Key key,
    this.image,
    this.title,
    this.isActive = false, this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.fromLTRB(size.height/70,0,size.height/70,0),
      height: size.width * 0.2,
      width: size.width* 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
        boxShadow: [
          isActive
              ? BoxShadow(
            offset: Offset(0, size.height/50),
            blurRadius: 20,
            color: kActiveShadowColor,
          )
              : BoxShadow(
            offset: Offset(0, 3),
            blurRadius: 6,
            color: kShadowColor,
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          Container(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Image.asset(image, height: size.width*0.13 ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child:   Text("$title", style: TextStyle(color: Colors.white, fontSize: size.width * 0.03, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
class CustomCardText extends StatelessWidget {
  final String number;
  final String title;
  final bool isActive;

  const CustomCardText({
    Key key,
    this.title,
    this.number,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.height/50),
        color: Colors.green,
        boxShadow: [
          isActive
              ? BoxShadow(
            offset: Offset(0, size.height/70),
            blurRadius: 20,
            color: kActiveShadowColor,
          )
              : BoxShadow(
            offset: Offset(0, size.height/70),
            blurRadius: 6,
            color: kShadowColor,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Text(
            number,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.height/25, color: Colors.pinkAccent),
          ),
          SizedBox(height: size.height/50,),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.height/50),
          ),
        ],
      ),
    );
  }
}