
import 'dart:convert';
import 'package:fai_kul/core/constants.dart';
import 'package:fai_kul/feature/attendance/attendance_method.dart';
import 'package:fai_kul/feature/login/data/models/login_response_model.dart';
import 'package:fai_kul/feature/schedule/api/schedule_model.dart';
import 'package:fai_kul/main.dart';
import 'package:fai_kul/main/main_utils.dart';

Future<List<ScheduleResponse>> getScheduleById() async{
  LoginResponseModel loginResponse = getCurrentUser();
  print("getScheduleById${loginResponse.idNhanVien}");
  final response = await client.get(
    mainUrl+"/v1/ThoiKhoaBieu?IDGiaoVien=${loginResponse.idNhanVien != null?loginResponse.idNhanVien:loginResponse.idHocVien}",
    // mainUrl+"/v1/ThoiKhoaBieu?IDGiaoVien=1377",
    headers: {
      "Accept": "application/json",
      "content-type": "application/json"       // k co header la failed 415
    },
  );
    print("getScheduleById: ${response.body}");
  if(response.statusCode == 200){
    var scheduleResponse = ScheduleSwagger.fromJson(json.decode(response.body));
    print("xxxxxxxx${scheduleResponse.data.length}");
    return scheduleResponse.data;
  }
  else{
    return null;
  }
}

Future<List<ScheduleResponse>> getScheduleInDay() async{
  LoginResponseModel loginResponse = getCurrentUser();
  DateTime dateTime = DateTime.now();
  String date = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
  print("getScheduleById${loginResponse.idNhanVien}");
  final response = await client.get(
    mainUrl+"/v1/ThoiKhoaBieu?IDGiaoVien=${loginResponse.idNhanVien != null?loginResponse.idNhanVien:loginResponse.idHocVien}"
        "FromDate=${date}&ToDate=${date}",
    // mainUrl+"/v1/ThoiKhoaBieu?IDGiaoVien=1377",
    headers: {
      "Accept": "application/json",
      "content-type": "application/json"       // k co header la failed 415
    },
  );
  print("getScheduleById: ${response.body}");
  if(response.statusCode == 200){
    var scheduleResponse = ScheduleSwagger.fromJson(json.decode(response.body));
    print("xxxxxxxx${scheduleResponse.data.length}");
    return scheduleResponse.data;
  }
  else{
    return null;
  }
}