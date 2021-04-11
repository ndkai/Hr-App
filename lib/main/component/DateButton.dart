import 'package:fai_kul/feature/attendance_his/presentation/widgets/component/body.dart';
import 'package:fai_kul/feature/dayoff/dayoff_page.dart';
import 'package:fai_kul/feature/login/presentation/widgets/Login/components/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class DateButton extends StatefulWidget {
  final String title;
  final DateTime dateTime;
  final String className;

  DateButton({Key key, this.title, this.dateTime, this.className}) : super(key: key);

  @override
  _DateButtonState createState() => _DateButtonState(title, dateTime);
}

class _DateButtonState extends State<DateButton> {
  String title;
  DateTime date;

  _DateButtonState(this.title, this.date);

  void setTime(DateTime dateTime) {
    setState(() {
      date = dateTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FlatButton(
        onPressed: () {
          _selectDate(context);
        },
        child: Column(
          children: <Widget>[
            Text(
              title =="From Day"? "Từ ngày": "Đến ngày",
              style: TextStyle(color: Colors.blue),
            ),
            Container(
              height: size.height / 25,
              width: size.width / 4,
              child: Center(
                child: Text(
                  date == null ? "" : '${date.day}/${date.month}/${date.year}',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(5)),
            )
          ],
        ));
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
    setTime(picked);
    if(title =="From Day" ){
      if(widget.className == "_AttendanceHisBodyState"){
        AttendanceHisBody.startDay = picked;
      } else
      if(widget.className == "_DayOffPageState"){
        DayOffPage.startDay = picked;
      }
    } else
    if(title =="To Day" ){
      if(widget.className == "_AttendanceHisBodyState"){
        AttendanceHisBody.endDay = picked;
      } else
      if(widget.className == "_DayOffPageState"){
        DayOffPage.endDay = picked;
      }
    }
  }
}
