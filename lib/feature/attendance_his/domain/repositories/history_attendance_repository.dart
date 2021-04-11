import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/feature/attendance_his/data/models/attendance_history_swagger.dart';
import 'package:fai_kul/feature/attendance_his/data/models/data.dart';

abstract class AttendanceHistoryRepository{
  Future<Either<Failure, AttendanceHistorySwagger>> geAttendanceHistory();
  Future<Either<Failure,AttendanceHistorySwagger>> geAttendanceHistoryByPage(int pageNumber);
  Future<Either<Failure, AttendanceHistorySwagger>> getLocalAttendanceHis();
}