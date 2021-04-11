
import 'package:fai_kul/feature/login/data/models/login_response_model.dart';

class LoginSwagger {
  bool success;
  int statusCode;
  LoginResponseModel data;
  String errorMessage;

  LoginSwagger(
      {this.success, this.statusCode, this.data, this.errorMessage});

  LoginSwagger.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    data = json['data'] != null ? new LoginResponseModel.fromJson(json['data']) : null;
    errorMessage = json['error_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['error_message'] = this.errorMessage;
    return data;
  }
}
