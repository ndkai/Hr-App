import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:fai_kul/core/constants.dart';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/feature/attendance_his/data/data_sources/remote_attendance_history_datasource.dart';
import 'package:fai_kul/feature/attendance_his/data/models/attendance_history_swagger.dart';
import 'package:fai_kul/feature/login/data/models/login_response_model.dart';
import 'package:fai_kul/feature/tuition_fee/domain/entities/FeeSwagger.dart';
import 'package:fai_kul/feature/tuition_fee/domain/entities/fee.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class RemoteFeeDataSource{
  Future<FeeSwagger> getStudentFee();
}

class RemoteFeeDataSourceImpl implements RemoteFeeDataSource{
  final http.Client client;

  RemoteFeeDataSourceImpl({this.client});

  @override
  Future<FeeSwagger> getStudentFee() {
    return _getURL();
  }

  Future<FeeSwagger> _getURL() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final loginResponce = prefs.getString(SAVE_LOGIN_RESPONSE);
    if(loginResponce != null && loginResponce != '') {
      LoginResponseModel lr = LoginResponseModel.fromJson(json.decode(loginResponce));
      final response = await client
          .get('$mainUrl/v1/HocVien/HocPhi',
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
            'Authorization': 'Bearer ${lr.token}', // k co header la failed 415
          });
      print("Fee_getURL: ${response.statusCode}");
      if (response.statusCode == 200) {
        print("Fee_getURL: ${response.body}");
        var swagger =
        FeeSwagger.fromJson(json.decode((response.body)));
        print("Fee_getURLasas${swagger.data[0].lstLopHoc.length}");
        return swagger;
      } else {
        throw ServerException();
      }
    }
  }

}