import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/network/network_info.dart';
import 'package:fai_kul/feature/attendance_his/data/data_sources/local_attendance_history_datasource.dart';
import 'package:fai_kul/feature/attendance_his/data/data_sources/remote_attendance_history_datasource.dart';
import 'package:fai_kul/feature/attendance_his/data/models/attendance_history_swagger.dart';
import 'package:fai_kul/feature/attendance_his/data/models/data.dart';
import 'package:fai_kul/feature/attendance_his/domain/repositories/history_attendance_repository.dart';

class AttendanceHistoryRepositoryImpl extends AttendanceHistoryRepository{
  final NetworkInfo networkInfo;
  final RemoteAttendanceHistoryDataSource remoteDataSource;
  final LocalAttendanceHistoryDataSource localDataSource;

  AttendanceHistoryRepositoryImpl({this.networkInfo, this.remoteDataSource, this.localDataSource});
  @override
  Future<Either<Failure, AttendanceHistorySwagger>> geAttendanceHistory() {
    log("geAttendanceHistory");
    return _getHistory(remoteDataSource.getAttendanceHistories());
  }

  @override
  Future<Either<Failure, AttendanceHistorySwagger>> geAttendanceHistoryByPage(int pageNumber) {
    log("geAttendanceHistoryByPage");
    return _getHistory(remoteDataSource.getAttendanceHistoriesByPages(pageNumber));
  }

  @override
  Future<Either<Failure, AttendanceHistorySwagger>> getLocalAttendanceHis() {
    return _getLocalHis();
  }

  Future<Either<Failure, AttendanceHistorySwagger>> _getHistory
      (Future<AttendanceHistorySwagger> getHistory) async {
    if(await networkInfo.isConnected){
      try{
        final histories = await getHistory;
        localDataSource.saveAttendanceHistory(histories);
        log("_getHistory ${histories.data.length}");
        return Right(histories);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else return Left(ServerFailure());
  }

  Future<Either<Failure, AttendanceHistorySwagger>> _getLocalHis() async{
    if(await networkInfo.isConnected){
      try{
      final data = await localDataSource.getLocalAttendanceHistory();
        return Right(data);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else return Left(ServerFailure());
  }

}