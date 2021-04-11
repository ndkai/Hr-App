import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/usecase/usecase.dart';
import 'package:fai_kul/feature/attendance_his/data/models/attendance_history_swagger.dart';
import 'package:fai_kul/feature/attendance_his/data/models/data.dart';
import 'package:fai_kul/feature/attendance_his/domain/repositories/history_attendance_repository.dart';

class GetAttendanceHistoryByPage extends UseCase<AttendanceHistorySwagger, Params>{
  final AttendanceHistoryRepository repository;

  GetAttendanceHistoryByPage(this.repository);

  @override
  Future<Either<Failure, AttendanceHistorySwagger>> call(Params params) {
    // TODO: implement call
    return repository.geAttendanceHistoryByPage(params.pageNumber);
  }

}

class Params extends Equatable{
  final int pageNumber;

  Params({this.pageNumber});


  @override
  // TODO: implement props
  List<Object> get props => [pageNumber];}