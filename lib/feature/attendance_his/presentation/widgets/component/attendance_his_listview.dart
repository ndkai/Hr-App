import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fai_kul/core/utils/image_convert.dart';
import 'package:fai_kul/feature/attendance_his/data/models/data.dart';
import 'package:fai_kul/feature/login/presentation/widgets/loading_widget.dart';
import 'package:fai_kul/feature/login/presentation/widgets/message_display.dart';
import 'package:fai_kul/main/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttenDanceHisListview extends StatefulWidget {
  final List<AttendanceHistory> list;

  const AttenDanceHisListview({Key key, this.list}) : super(key: key);

  @override
  _AttenDanceHisListviewState createState() => _AttenDanceHisListviewState();
}
GlobalKey<_AttenDanceHisListviewState> historyListKey = new GlobalKey<_AttenDanceHisListviewState>();

class _AttenDanceHisListviewState extends State<AttenDanceHisListview> {
  List<AttendanceHistory> listState;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    listState = widget.list;
    ScrollController _controller = new ScrollController();
    return Container(
        height: size.height * 0.8,
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: _buildListItemsFromitems(listState),
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          controller: _controller,
        ));
  }

  List<Container> _buildListItemsFromitems(List<AttendanceHistory> list) {
    list = list.reversed.toList();
    int index = 0;
    return list.map((item) {
      var parseDate = DateTime.parse(item.ngayGioChamCong);
      String trangThai = "";
      item.idPhuongThucChamCong == 1? trangThai = "Điểm danh vào": trangThai = "Điểm danh ra";
      var container = Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 50),
              blurRadius: 20,
              color: kActiveShadowColor,
            )
          ],
        ),
        child: Row(
          children: <Widget>[
            Container(
              height: 50,
              width: 50,
              margin: new EdgeInsets.all(10.0),
              child: item.idPhuongThucChamCong == 1? Image.asset("assets/icons/check_in_icon.png"):Image.asset("assets/icons/checkout_icon.png"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: new Text(
                        'Thời gian: ${parseDate.hour}:${parseDate.minute.toString().length<1?parseDate.minute.toString()+"0":parseDate.minute.toString()} ${parseDate.day}/${parseDate.month}/${parseDate.year}',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.black),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: new Text(
                        'Trạng thái: ${trangThai}',
                        style: new TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15.0,
                            color: Colors.black),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      );
      index = index + 1;
      return container;
    }).toList();
  }

  void setList(DateTime startTime, DateTime endTime){
    List<AttendanceHistory> list1 = List<AttendanceHistory>();
    for(AttendanceHistory item in widget.list){
      if(DateTime.parse(item. ngayGioChamCong).compareTo(startTime) >=0
          && DateTime.parse(item.ngayGioChamCong).compareTo(endTime) <=0){
        list1.add(item);
      }
    }
    setState(() {
          listState = list1;
          print("asdasd${list1.length}");
    });

  }
}
