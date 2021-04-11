import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'card.dart';

class HomeAttendanceCount extends StatelessWidget {
  final int absent;
  final int goLate;
  final int present;

  const HomeAttendanceCount({Key key, this.absent, this.goLate, this.present})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(0, 3, 0, 10),
      height: size.height*0.15,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          CustomCardText(
            isActive: true,
            number: absent.toString(),
            title: "     Absent    ",
          ),
          CustomCardText(
            isActive: true,
            number: goLate.toString(),
            title: "     Go late     ",
          ),
          CustomCardText(
            isActive: true,
            number: present.toString(),
            title: "     Present     ",
          ),
        ],
      ),
    );
  }
}
