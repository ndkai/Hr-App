


import 'dart:convert';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/feature/login/data/models/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalLoginDataSource{
  Future<LoginResponseModel> getLoginUser();
  
  Future<void> saveLoginResponse(LoginResponseModel loginResponseModel);
}

const SAVE_LOGIN_RESPONSE = 'SAVE_LOGIN_RESPONSE';

class LocalLoginDataSourceImpl implements LocalLoginDataSource{
  final SharedPreferences sharedPreferences;

  LocalLoginDataSourceImpl({this.sharedPreferences});

  @override
  Future<LoginResponseModel> getLoginUser() {
    final jsonString = sharedPreferences.getString(SAVE_LOGIN_RESPONSE);
    if(jsonString != null && jsonString!=''){
      return Future.value(LoginResponseModel.fromJson(json.decode(jsonString)));
    } else{
      throw CacheException();
    }
  }

  @override
  Future<void> saveLoginResponse(LoginResponseModel loginResponseModel) {
    print("saveLoginResponse${ json.encode(loginResponseModel.toJson())}");
    return sharedPreferences.setString(
        SAVE_LOGIN_RESPONSE,
        json.encode(loginResponseModel.toJson()));
  }

  
}

