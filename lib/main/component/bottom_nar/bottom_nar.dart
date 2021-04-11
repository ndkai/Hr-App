import 'package:fai_kul/feature/account_page/page/account_page.dart';
import 'package:fai_kul/feature/attendance_his/presentation/pages/attendance_history_page.dart';
import 'package:fai_kul/feature/schedule/schedule_class.dart';
import 'package:fai_kul/main/nar_drawer/drawer_pages/attendance_page.dart';
import 'package:fai_kul/main/nar_drawer/drawer_pages/managermant_page.dart';
import 'package:fai_kul/main/nar_drawer/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNar extends StatefulWidget {
  final int index;
  BottomNar({Key key, this.index}): super(key : key);
  @override
  _BottomNarState createState() => _BottomNarState();
}

GlobalKey<_BottomNarState> bottomNarState = new GlobalKey<_BottomNarState>();

class _BottomNarState extends State<BottomNar> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
       try{
         Navigator
             .of(context)
             .pushReplacement(
             new MaterialPageRoute(builder: (BuildContext context) {
               return HomePage(
                 key: textGlobalKey,
               );
             }));
       }         catch(e){}
        break;
      case 1:
        Navigator
            .of(context)
            .pushReplacement(
            new MaterialPageRoute(builder: (BuildContext context) {
              return SchedulePage();
            }));
        break;
      case 2:
        Navigator
            .of(context)
            .pushReplacement(
            new MaterialPageRoute(builder: (BuildContext context) {
              return AttendanceHisPage();
            }));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    print("BottomNavigationBarxx${widget.index}");
    return BottomNavigationBar(
      items: const<BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
            title: Text('Thời khóa biểu')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.face),
            title: Text('Điểm danh')
        ),
      ],
      currentIndex: widget.index!= null?widget.index: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap:  _onItemTapped,
    );
  }
}
