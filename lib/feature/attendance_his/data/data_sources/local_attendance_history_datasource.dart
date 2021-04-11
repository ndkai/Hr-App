import 'dart:convert';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/feature/attendance_his/data/models/attendance_history_swagger.dart';
import 'package:fai_kul/feature/attendance_his/data/models/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalAttendanceHistoryDataSource{
    Future<AttendanceHistorySwagger> getLocalAttendanceHistory();

    Future<void> saveAttendanceHistory(AttendanceHistorySwagger data);
}

const  LOCAL_ATTENDANCE_HISTORY = "LOCAL_ATTENDANCE_HISTORY";
class LocalAttendanceHistoryDataSourceIml extends LocalAttendanceHistoryDataSource{
  final SharedPreferences sharedPreferences;

  LocalAttendanceHistoryDataSourceIml({this.sharedPreferences});
  
  @override
  Future<AttendanceHistorySwagger> getLocalAttendanceHistory() {
    final jsonString = sharedPreferences.getString(LOCAL_ATTENDANCE_HISTORY);
    if(jsonString!= null && jsonString != ''){
      var temp = AttendanceHistorySwagger.fromJson((json.decode(jsonString)));
       return Future.value(temp);
    } else{
      throw CacheException();
    }
  }

  @override
  Future<void> saveAttendanceHistory(AttendanceHistorySwagger data) {
    return sharedPreferences.setString(LOCAL_ATTENDANCE_HISTORY, json.encode(data.toJson()));
  }

}
