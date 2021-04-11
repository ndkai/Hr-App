import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/usecase/usecase.dart';
import 'package:fai_kul/feature/attendance_his/data/models/attendance_history_swagger.dart';
import 'package:fai_kul/feature/attendance_his/data/models/data.dart';
import 'package:fai_kul/feature/attendance_his/domain/repositories/history_attendance_repository.dart';

class GetLocalAttendanceHis implements UseCase<AttendanceHistorySwagger, NoParams>{
  final AttendanceHistoryRepository repository;

  GetLocalAttendanceHis(this.repository);

  @override
  Future<Either<Failure, AttendanceHistorySwagger>> call(NoParams params) async {
    // TODO: implement call
    return await repository.getLocalAttendanceHis();
  }
}
