import 'dart:convert';
import 'dart:math';

import 'package:fai_kul/core/constants.dart';
import 'package:fai_kul/feature/attendance/attendance_method.dart';
import 'dart:async';
import 'dart:core';

import 'package:fai_kul/main.dart';

Future<bool> setDayOff(
    int id, String stDate, String endDate, String note) async {
  print("call setDayOff");
  var body = jsonEncode({
      "idLoaiNghiPhep": id,
      "ngayBatDau": stDate,
      "ngayKetThuc": endDate,
      "ghiChu": note
  });
  final response =
      await client.post("$mainUrl/v1/NghiPhep", body: body, headers: {
    "Accept": "application/json",
    "content-type": "application/json",
    'Authorization': 'Bearer ${appUser.token}', // k co header la failed 415
  });
  if (response.statusCode == 201) {
    print("call setDayOff success");
    return true;
  } else {
    print("call setDayOff failed");
    return false;
  }
}
