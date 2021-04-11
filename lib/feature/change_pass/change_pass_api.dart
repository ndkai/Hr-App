import 'dart:convert';

import 'package:fai_kul/core/constants.dart';
import 'package:fai_kul/feature/attendance/attendance_method.dart';

import '../../main.dart';

Future<bool> changePass(String oldPass, String newPass) async {
  var body = jsonEncode({
    "oldPassword": oldPass,
    "newPassword": newPass
  });
  print("lolol${oldPass}");
  print("lolol${newPass}");
  final response = await client.put(
    // mainUrl+"/v1/ThoiKhoaBieu?IDGiaoVien=${loginResponse.idNhanVien != null?loginResponse.idNhanVien:loginResponse.idHocVien}",
    "$mainUrl/v1/TaiKhoan/CapNhapMatKhauBySelf",
    headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      'Authorization': 'Bearer ${appUser.token}', // k co header la failed 415
    },
    body: body,
  );
  print("changePass${response.statusCode}");
  if(response.statusCode == 200){
     return true;
  }
  return false;
}