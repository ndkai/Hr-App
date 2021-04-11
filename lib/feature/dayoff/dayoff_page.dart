import 'package:fai_kul/main/component/DateButton.dart';
import 'package:fai_kul/main/nar_drawer/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DayOffPage extends StatefulWidget {
  static const String routeName = 'DateOffPage';
  static DateTime startDay;
  static DateTime endDay;
  @override
  _DayOffPageState createState() => _DayOffPageState();
}

class _DayOffPageState extends State<DayOffPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng kí nghỉ phép'),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(
                    key: textGlobalKey,
                  )),
            );
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Text("Chọn thời gian bạn muốn nghỉ"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DateButton(title: 'From Day', className: "_DayOffPageState",),
                DateButton(title: 'To Day', className: "_DayOffPageState"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
