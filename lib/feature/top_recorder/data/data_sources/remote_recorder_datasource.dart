import 'dart:convert';

import 'package:fai_kul/core/constants.dart';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/feature/attendance_his/data/data_sources/remote_attendance_history_datasource.dart';
import 'package:fai_kul/feature/login/data/models/login_response_model.dart';
import 'package:fai_kul/feature/top_recorder/domain/entities/toprecorder_swagger.dart';
import 'package:fai_kul/main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


abstract class RemoteRecorderDataSource{
  Future<TopRecorderSwagger> getTopRecorder();
}

class RemoteRecorderDataSourceImpl implements RemoteRecorderDataSource{
  final http.Client client;

  RemoteRecorderDataSourceImpl({this.client});
  @override
  Future<TopRecorderSwagger> getTopRecorder() {
    return getDataSource();
  }

  Future<TopRecorderSwagger> getDataSource() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //get loginrp
    final loginResponce = prefs.getString(SAVE_LOGIN_RESPONSE);
    if(loginResponce != null && loginResponce != '') {
      LoginResponseModel lr = LoginResponseModel.fromJson(
          json.decode(loginResponce));
      print("lolmamads${appUser.idNhanVien}");
      final response = await client
          .get('$mainUrl/v1/NhanVien/giaovien/danhsachsodaubai',
          headers: {
            "Accept": "application/json",
            "content-type": "application/json", //
            'Authorization': 'Bearer ${appUser.token}', // k co header la failed 415
          });
      print("TopRecorderSwagger ${response.statusCode}");
      if(response.statusCode == 200){
        print("TopRecorderSwagger thanh cong");
        var swagger = TopRecorderSwagger.fromJson(json.decode(response.body));
        print("TopRecorderSwagger ${swagger.data.length}");
        print("TopRecorderSwagger ${response.body}");
        return swagger;
      }
      else {
        throw ServerException();
      }
    }
    else throw ServerException();
    
  }

}

