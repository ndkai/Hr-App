import 'package:fai_kul/main/component/bottom_nar/bottom_nar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '../main_drawer.dart';

class ManagementPage extends StatefulWidget {
  static const String routeName = '/managementPage';

  @override
  _ManagementPageState createState() => _ManagementPageState();
}

class _ManagementPageState extends State<ManagementPage> {
  static const String routeName = '/locationpage';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Management"),
        ),
        drawer: NavigationDrawer(),
        bottomNavigationBar: BottomNar(index: 1),
        body: Column(
          children: <Widget>[
            studentInfo(context),
            studentScore(context),
            studentTem(context)
          ],
        ));
  }

  Widget studentInfo(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.25,
      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
            Colors.blue,
            Colors.lightBlue,
          ])),
      child: Row(
        mainAxisAlignment:  MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage("assets/images/titkul_logo.jpg"),
          ),
        ],
      ),
    );
  }

  Widget studentScore(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.25,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Colors.green, Colors.greenAccent])),
      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Center(
        child: Text(
          'Student Score',
          style: TextStyle(fontSize: 25,color: Colors.white),
        ),
      ),
    );
  }

  Widget studentTem(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.25,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Colors.purple, Colors.purpleAccent])),
      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Center(
        child: Text(
          'Student Temperature',
          style: TextStyle(fontSize: 25,color: Colors.white),
        ),
      ),
    );
  }
}
