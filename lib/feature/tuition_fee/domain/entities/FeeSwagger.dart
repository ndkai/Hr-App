import 'Fee.dart';

class FeeSwagger {
  bool success;
  int statusCode;
  Null meta;
  List<Fee> data;
  String message;

  FeeSwagger(
      {this.success, this.statusCode, this.meta, this.data, this.message});

  FeeSwagger.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    meta = json['meta'];
    if (json['data'] != null) {
      data = new List<Fee>();
      json['data'].forEach((v) {
        data.add(new Fee.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    data['meta'] = this.meta;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}