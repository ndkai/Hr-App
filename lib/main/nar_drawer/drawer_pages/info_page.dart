import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home_page.dart';
import '../main_drawer.dart';

class InfoPage extends StatelessWidget {
  static const String routeName = '/InfoPage';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return new Scaffold(
        appBar: AppBar(
          title: Text("Infomation"),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage(key: textGlobalKey,)),
              );
            },
          ),
        ),
        drawer: NavigationDrawer(),
        body: body(size));
  }

  Widget body(Size size) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/blue_bg.jpg"),
          fit: BoxFit.cover,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(                                                                               
              radius: size.height*0.07,
              backgroundImage: AssetImage("assets/images/titkul_logo.jpg"),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 5,),
                Image.asset("assets/images/titkul_name.png", height: size.width*0.1,),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.home,
                      size: size.width*0.06,
                      color: Colors.pink,
                    ),
                    Text("   131 Nguyễn Khoái, District 4, Hồ Chí Minh city",
                        style: TextStyle(fontSize: size.width*0.04, color: Colors.white))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.phone,
                      size: size.width*0.06,
                      color: Colors.pink,
                    ),
                    Text(
                      "   0938806388",
                      style: TextStyle(fontSize: size.width*0.04, color: Colors.white),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.mail,
                      size: size.width*0.06,
                      color: Colors.pink,
                    ),
                    Text("   Titkul2020@gmail.com",
                        style: TextStyle(fontSize: size.width*0.04, color: Colors.white))
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
