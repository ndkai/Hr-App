import 'dart:convert';
import 'dart:async';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:fai_kul/core/constants.dart';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/feature/attendance_his/data/data_sources/remote_attendance_history_datasource.dart';
import 'package:fai_kul/feature/login/data/models/login_response_model.dart';
import 'package:fai_kul/main/nar_drawer/page_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:foreground_service/foreground_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signalr_core/signalr_core.dart';
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
Future<void> setNotification() async {
  bool result = await DataConnectionChecker().hasConnection;
  if(result == true){
    print('_getTokenqqqqq');
    final connection = HubConnectionBuilder().withUrl(
        '$mainUrl/hub',
        HttpConnectionOptions(
          transport: HttpTransportType.longPolling,
          logging: (level, message) => print('xxx$message'),
          accessTokenFactory: () => _getToken(),
        )).withAutomaticReconnect()
        .build();
    connection.serverTimeoutInMilliseconds = 9999;
    connection.on('ReminderNotification',  (message) async {
      print('initHubLol: $message');
      //notication
      if(!message.contains("Content")){
      flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();
      var initializationSettingsAndroid =
      AndroidInitializationSettings('ec_logo');
      var initializationSettingsIOs = IOSInitializationSettings();
      var initSetttings = InitializationSettings(
          initializationSettingsAndroid, initializationSettingsIOs);

      flutterLocalNotificationsPlugin.initialize(initSetttings,
          onSelectNotification: onSelectNotification);
      await showNotification(0);
    }});
    await connection.start();
    print('_initHub start');

    await connection.invoke(
        'NotifyToCaller', args: ['AttendanceNotification', "Content"]);
  }
  else{
    await ForegroundService.notification
        .setText("THua roi${DateTime.now()}");
  }

}

Future<String> _getToken() async {
  //get loginrp
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final loginResponce = prefs.getString(SAVE_LOGIN_RESPONSE);
  if (loginResponce != null && loginResponce != '') {
    var responce = LoginResponseModel.fromJson(json.decode(loginResponce));
    print('_getToken${responce.token}');
    return responce.token;
  } else {
    throw CacheException();
  }
}

Future onSelectNotification(String payload) {
  // Navigator.pushReplacementNamed(context, PageRoutes.attendanceHis);
}

Future<void> cancelNotification() async {
  await flutterLocalNotificationsPlugin.cancel(0);
}

void showNotification(int activity) async {
  flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  var initializationSettingsAndroid =
  AndroidInitializationSettings('ec_logo');
  var initializationSettingsIOs = IOSInitializationSettings();
  var initSetttings = InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOs);

  flutterLocalNotificationsPlugin.initialize(initSetttings,
      onSelectNotification: onSelectNotification);
  print("yeu em 3k");
  var android = new AndroidNotificationDetails(
      'id', 'channel ', 'description',
      priority: Priority.High, importance: Importance.Max);
  var iOS = new IOSNotificationDetails();
  var platform = new NotificationDetails(android, iOS);
  if(activity == 0){
    await flutterLocalNotificationsPlugin.show(
        0, 'Điểm danh thành công', 'Chúc mừng bạn đã điểm danh thành công', platform,
        payload: 'Welcome to the Local Notification');
  }   else
  if(activity == 1){
    await flutterLocalNotificationsPlugin.show(
        0, 'Điểm danh thành công', 'Điểm danh thành công', platform,
        payload: 'Welcome to the Local Notification ');
  }

}