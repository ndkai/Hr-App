import 'dart:math';

import 'package:fai_kul/feature/attendance_his/data/models/data.dart';
import 'package:fai_kul/feature/attendance_his/presentation/manager/attendance_his/attendance_his_bloc.dart';
import 'package:fai_kul/feature/attendance_his/presentation/widgets/component/attendance_his_listview.dart';
import 'package:fai_kul/feature/login/presentation/widgets/loading_widget.dart';
import 'package:fai_kul/feature/login/presentation/widgets/message_display.dart';
import 'package:fai_kul/injection_container.dart';
import 'package:fai_kul/main/component/DateButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'attendance_his_listview.dart';

class AttendanceHisBody extends StatefulWidget {
  static DateTime startDay;
  static DateTime endDay;
  static List<AttendanceHistory> currentList;
  @override
  _AttendanceHisBodyState createState() => _AttendanceHisBodyState();
}

class _AttendanceHisBodyState extends State<AttendanceHisBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height*0.9,
        width: size.width,
        child:Column(
          children: <Widget>[
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                DateButton(title: 'From Day', className: "_AttendanceHisBodyState",),
                DateButton(title: 'To Day', className: "_AttendanceHisBodyState",),
                OutlineButton(
                  child: new Text("Lọc", style: TextStyle(color: Colors.black, fontSize: 14)),
                  onPressed: (){
                    print('yyyyyy ${AttendanceHisBody.startDay}');
                   filterAH();
                  },
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.blue,
                )
              ],
            ),
            SizedBox(height: 10),
            BlocBuilder<AttendanceHisBloc, AttendanceHisState>(
              builder: (context, state) {
                if (state is Empty) {
                  dispatchListHistoies();
                  return MessageDisplay(
                    message: 'Start searching!',
                  );
                } else if (state is Loading) {
                  return Center(
                    child:LoadingWidget() ,
                  );
                } else if (state is Loaded) {
                  AttendanceHisBody.currentList = state.attendanceHistories;
                  print("ddd${state.attendanceHistories.length}");
                  ///ta lọc list theo người ở  đây
                 return AttenDanceHisListview(key: historyListKey,list: state.attendanceHistories);
                } else if (state is Error) {
                  return MessageDisplay(message: "Hiện tại chưa có thông tin");
                } else{
                  if(state is FilterAHState){
                    print("oooooo+${state.attendanceHistories.length}");
                    return new AttenDanceHisListview(key: historyListKey,list: state.attendanceHistories,);
                  }
                }
              },
            )
          ],
        )

    );
  }

  void dispatchListHistoies() {
    BlocProvider.of<AttendanceHisBloc>(context).add(GetListAH());
  }

  void filterAH(){
    if(AttendanceHisBody.startDay != null && AttendanceHisBody.endDay != null && AttendanceHisBody.currentList != null){
      print("1111333");
      BlocProvider.of<AttendanceHisBloc>(context)
          .add(FilterAHEvent(AttendanceHisBody.startDay, AttendanceHisBody.endDay, AttendanceHisBody.currentList));
    }
  }
  
}
