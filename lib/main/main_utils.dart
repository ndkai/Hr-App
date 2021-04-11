import 'dart:convert';

import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/feature/login/data/models/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'nar_drawer/home_page.dart';

LoginResponseModel getCurrentUser()  {
  final loginResponce = prefs.getString(SAVE_LOGIN_RESPONSE);
  if (loginResponce != null && loginResponce != '') {
    var responce = LoginResponseModel.fromJson(json.decode(loginResponce));
    print('getCurrentUser${responce.displayName}');
    return responce;
  } else {
    throw CacheException();
  }
}