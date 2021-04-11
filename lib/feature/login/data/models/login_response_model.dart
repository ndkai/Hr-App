import 'package:meta/meta.dart';

class LoginResponseModel {
  String displayName;
  String token;
  int idNhanVien;
  int idHocVien;
  int idChucVu;
  ChucVu chucVu;
  String username;
  String email;
  String expires;
  String roleName;

  LoginResponseModel(
      {this.displayName,
        this.token,
        this.idNhanVien,
        this.idHocVien,
        this.idChucVu,
        this.chucVu,
        this.username,
        this.email,
        this.expires,
        this.roleName});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    token = json['token'];
    idNhanVien = json['idNhanVien'];
    idHocVien = json['idHocVien'];
    idChucVu = json['idChucVu'];
    chucVu =
    json['chucVu'] != null ? new ChucVu.fromJson(json['chucVu']) : null;
    username = json['username'];
    email = json['email'];
    expires = json['expires'];
    roleName = json['roleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['displayName'] = this.displayName;
    data['token'] = this.token;
    data['idNhanVien'] = this.idNhanVien;
    data['idHocVien'] = this.idHocVien;
    data['idChucVu'] = this.idChucVu;
    if (this.chucVu != null) {
      data['chucVu'] = this.chucVu.toJson();
    }
    data['username'] = this.username;
    data['email'] = this.email;
    data['expires'] = this.expires;
    data['roleName'] = this.roleName;
    return data;
  }
}

class ChucVu {
  int id;
  String maChucVu;
  String tenChucVu;
  int phuCapChucVu;
  int doUuTien;

  ChucVu(
      {this.id,
        this.maChucVu,
        this.tenChucVu,
        this.phuCapChucVu,
        this.doUuTien});

  ChucVu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    maChucVu = json['maChucVu'];
    tenChucVu = json['tenChucVu'];
    phuCapChucVu = json['phuCapChucVu'];
    doUuTien = json['doUuTien'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['maChucVu'] = this.maChucVu;
    data['tenChucVu'] = this.tenChucVu;
    data['phuCapChucVu'] = this.phuCapChucVu;
    data['doUuTien'] = this.doUuTien;
    return data;
  }
}
