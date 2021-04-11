import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/network/network_info.dart';
import 'package:fai_kul/feature/tuition_fee/data/data_sources/remote_student_fee.dart';
import 'package:fai_kul/feature/tuition_fee/domain/entities/FeeSwagger.dart';
import 'package:fai_kul/feature/tuition_fee/domain/entities/fee.dart';
import 'package:fai_kul/feature/tuition_fee/domain/repositories/fee_repository.dart';

class FeeRepositoryImpl implements FeeRepository{
  final NetworkInfo networkInfo;
  final RemoteFeeDataSource remoteDataSource;

  FeeRepositoryImpl({this.networkInfo, this.remoteDataSource});
  @override
  Future<Either<Failure, FeeSwagger>> getStudentFee() {
    return _getStudentFee(remoteDataSource.getStudentFee());
  }

  Future<Either<Failure, FeeSwagger>> _getStudentFee
      (Future<FeeSwagger> getFee) async {
    if(await networkInfo.isConnected){
      try{
        final fees = await getFee;
        print("_getStudentFee ${fees.data.length}");
        return Right(fees);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else return Left(ServerFailure());
  }

}