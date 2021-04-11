import 'package:fai_kul/feature/account_page/component/avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.deepOrange,
      height: size.height * 0.3,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: FractionalOffset.topLeft,
            child:Padding(
              padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
              child:  Icon(
                Icons.notifications_none_outlined,
                size: 26.0,
                color: Colors.white,
              ),
            )
          ),
          Align(
              alignment: FractionalOffset.topLeft,
              child:Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Avatar()
              )
          ),
          Align(
              alignment: FractionalOffset.topLeft,
              child:Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 20, 0),
                child:  Icon(
                  Icons.settings,
                  size: 26.0,
                  color: Colors.white,
                ),
              )
          ),
        ],
      ),
    );
  }
}
