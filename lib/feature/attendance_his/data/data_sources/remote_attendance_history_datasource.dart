import 'dart:convert';
import 'dart:developer';

import 'package:fai_kul/core/constants.dart';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/feature/attendance_his/data/models/attendance_history_swagger.dart';
import 'package:fai_kul/feature/attendance_his/data/models/data.dart';
import 'package:fai_kul/feature/login/data/models/login_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const SAVE_LOGIN_RESPONSE = 'SAVE_LOGIN_RESPONSE';

abstract class RemoteAttendanceHistoryDataSource {
  Future<AttendanceHistorySwagger> getAttendanceHistories();

  Future<AttendanceHistorySwagger> getAttendanceHistoriesByPages(int pageNumber);
}

class RemoteAttendanceHistoryDataSourceImpl
    implements RemoteAttendanceHistoryDataSource {
  final http.Client client;

  RemoteAttendanceHistoryDataSourceImpl({this.client});

  @override
  Future<AttendanceHistorySwagger> getAttendanceHistories() {
    // TODO: implement getAttendanceHistories
    return _getFromUrl(0);
  }

  @override
  Future<AttendanceHistorySwagger> getAttendanceHistoriesByPages(
      int pageNumber) {
    // TODO: implement getAttendanceHistoriesByPages
    return _getFromUrl(pageNumber);
  }

  Future<AttendanceHistorySwagger> _getFromUrl(int number) async {
    String s ="";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //get loginrp
    final loginResponce = prefs.getString(SAVE_LOGIN_RESPONSE);
    if(loginResponce != null && loginResponce != '') {
      LoginResponseModel lr = LoginResponseModel.fromJson(json.decode(loginResponce));
      if (number != 0) {
        s = "/?page_number=$number";
      }
      final response = await client
          .get('$mainUrl/v1/ChamCong/LichSuDiemDanh' + s,
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
            'Authorization': 'Bearer ${lr.token}', // k co header la failed 415
          });
         print("response ${response.statusCode}");
      if (response.statusCode == 200) {
        log("xxx1: ${response.body}");
        var swagger =
        AttendanceHistorySwagger.fromJson(json.decode((response.body)));
        print("loma${swagger.data[1]}");
        return swagger;
      } else {
        throw ServerException();
      }
    }
    else throw ServerException();

  }
}
