import 'dart:convert';

import 'package:fai_kul/core/constants.dart';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/feature/login/data/models/login_swagger.dart';
import 'package:fai_kul/feature/login/data/models/login_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'dart:developer';

abstract class LoginResponseDataSource {
  Future<LoginResponseModel> login(String email, String pass);
}

class LoginResponseImpl implements LoginResponseDataSource {
  final http.Client client;

  LoginResponseImpl({@required this.client});


  @override
  Future<LoginResponseModel> login(String email, String pass) =>
      _loginFromUrl(email, pass);

  Future<LoginResponseModel> _loginFromUrl(String email, String pass) async {
    var body = jsonEncode( {
      'username': email,
      'password': pass
    });
    final response = await client.post(
        '$mainUrl/v1/TaiKhoan/DangNhap',
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"       // k co header la failed 415
        },
        body: body).timeout(Duration(seconds: 15));
    print("11111${response.statusCode}");
    if (response.statusCode == 200) {
      log("xxx1: ${json.decode(response.body)}");
      var swagger = LoginSwagger.fromJson(json.decode((response.body)));
      return swagger.data;
    }
      else {
      throw ServerException();
    }
  }

}
