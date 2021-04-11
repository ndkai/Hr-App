import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/network/network_info.dart';
import 'package:fai_kul/feature/attendance_his/data/models/attendance_history_swagger.dart';
import 'package:fai_kul/feature/top_recorder/data/data_sources/remote_recorder_datasource.dart';
import 'package:fai_kul/feature/top_recorder/domain/entities/toprecorder_swagger.dart';
import 'package:fai_kul/feature/top_recorder/domain/repositories/toprecorder_repository.dart';

class TopRecorderRepositoryImpl implements TopRecorderRepo{
  final NetworkInfo networkInfo;
  final RemoteRecorderDataSource recorderDataSource;

  TopRecorderRepositoryImpl({this.networkInfo, this.recorderDataSource});
  @override
  Future<Either<Failure, TopRecorderSwagger>> getTopRecorder() {
    return getData(recorderDataSource.getTopRecorder());
  }

  Future<Either<Failure, TopRecorderSwagger>> getData
      (Future<TopRecorderSwagger> getTopRecorder) async {
    print("có hchajy ở day k");
    if(await networkInfo.isConnected){
      try{
        final histories = await getTopRecorder;

        return Right(histories);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else return Left(ServerFailure());
  }

}