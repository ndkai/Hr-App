import 'dart:math';

import 'package:fai_kul/feature/schedule/api/schedule_model.dart';
import 'package:fai_kul/main/component/bottom_nar/bottom_nar.dart';
import 'package:fai_kul/main/nar_drawer/home_page.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'api/get_schedule.dart';

class SchedulePage extends StatefulWidget {
  static const String routeName = '/SchedulePage';

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

var _colorCollection;

class _SchedulePageState extends State<SchedulePage> {
  List<Meeting> scheduleData = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _colorCollection = [
      Colors.redAccent,
      Colors.blue,
      Colors.green,
      Colors.purpleAccent,
    ];
    getListSchedule();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNar(index: 1),
      appBar: AppBar(
        title: Text('Thời khóa biểu'),
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
      // body: SfCalendar(
      //   view: CalendarView.week,
      //   firstDayOfWeek: 1, //
      //   timeSlotViewSettings: TimeSlotViewSettings(
      //       timeFormat: 'Tiết' + ' hh',
      //       nonWorkingDays: <int>[DateTime.friday, DateTime.saturday],
      //       timeIntervalHeight: size.height * 0.1,
      //       timeTextStyle: TextStyle(
      //         fontWeight: FontWeight.w500,
      //         fontStyle: FontStyle.italic,
      //         fontSize: 15,
      //         color: Colors.blue,
      //       ),
      //       dateFormat: 'd',
      //       dayFormat: 'EEE',
      //       startHour: 0,
      //       endHour: 5),
      //   todayHighlightColor: Colors.red,
      //   initialDisplayDate: DateTime.now(),
      //   cellBorderColor: Colors.black,
      //   showNavigationArrow: true,
      //   dataSource: MeetingDataSource(scheduleData),
      // )
      body: SfCalendar(
        view: CalendarView.month,
        showNavigationArrow: true,
        todayHighlightColor: Colors.red,
        monthViewSettings: MonthViewSettings(
            showAgenda: true,
            
            appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
            navigationDirection: MonthNavigationDirection.horizontal,
            dayFormat: 'EEE',),
        dataSource: DataSource(scheduleData),
        appointmentTimeTextFormat: 'HH:mm:a',
      ),
    );
  }

  Future<List<Meeting>> getListSchedule() async {
    List<Meeting> listMT = List<Meeting>();
    List<ScheduleResponse> listRs = await getScheduleById();
    for (var item in listRs) {
      // DateTime startTime = DateTime.tryParse(item.tietHoc.thoiGianBatDau);
      // DateTime endTime = DateTime.tryParse(item.tietHoc.thoiGianKetThuc);
      DateTime day = DateTime.parse(item.ngay);
      var sTime = item.tietHoc.thoiGianKetThuc.split(":");
      var eTime = item.tietHoc.thoiGianKetThuc.split(":");
      DateTime startDay = day.add(Duration(
          hours: int.parse(sTime[0]),
          minutes: int.parse(sTime[0]),
          seconds: int.parse(sTime[0])));
      DateTime endDay = day.add(Duration(
          hours: int.parse(eTime[0]),
          minutes: int.parse(eTime[0]),
          seconds: int.parse(eTime[0])));
      listMT.add(Meeting(
          from: startDay,
          to: endDay,
          background: Colors.green,
          eventName: "${item.tietHoc.tenTietHoc}, ${item.lopHoc.tenLopHoc}"));
    }
    print("List mt ${listMT.length}");
    setState(() {
      scheduleData = listMT;
    });
    return listMT;
  }
}

class Meeting {
  Meeting(
      {@required this.from,
      @required this.to,
      this.background = Colors.green,
      this.isAllDay = false,
      this.eventName = '',
      this.startTimeZone = '',
      this.endTimeZone = '',
      this.description = ''});

  final String eventName;
  final DateTime from;
  final DateTime to;
  final Color background;
  final bool isAllDay;
  final String startTimeZone;
  final String endTimeZone;
  final String description;
}

class DataSource extends CalendarDataSource {
  DataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  bool isAllDay(int index) => appointments[index].isAllDay;

  @override
  String getSubject(int index) => appointments[index].eventName;

  @override
  String getStartTimeZone(int index) => appointments[index].startTimeZone;

  @override
  String getNotes(int index) => appointments[index].description;

  @override
  String getEndTimeZone(int index) => appointments[index].endTimeZone;

  @override
  Color getColor(int index) => appointments[index].background;

  @override
  DateTime getStartTime(int index) => appointments[index].from;

  @override
  DateTime getEndTime(int index) => appointments[index].to;
}
