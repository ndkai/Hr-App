import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/network/network_info.dart';
import 'package:fai_kul/feature/login/data/data_sources/login_local_data_sourse.dart';
import 'package:fai_kul/feature/login/data/data_sources/login_response-data_source.dart';
import 'package:fai_kul/feature/login/data/models/login_response_model.dart';
import 'dart:developer';

import 'package:fai_kul/feature/login/domain/repositories/login_response_repository.dart';

class LoginRepositoryImpl implements LoginResponseRepository {
  final LoginResponseDataSource loginResponseDataSource;
  final NetworkInfo networkInfo;
  final LocalLoginDataSource localLoginDataSource;

  LoginRepositoryImpl({this.loginResponseDataSource, this.networkInfo, this.localLoginDataSource});

  @override
  Future<Either<Failure, LoginResponseModel>> login(String email, String pass) {
    return _login(loginResponseDataSource.login(email, pass));
  }

  @override
  Future<Either<Failure, LoginResponseModel>> getCurrentUser() {
    return _getUser();
  }

  Future<Either<Failure, LoginResponseModel>> _login
      (Future<LoginResponseModel> getLoginInfo) async {

    if(await networkInfo.isConnected){
      try{
        final loginResponse = await getLoginInfo;
        localLoginDataSource.saveLoginResponse(loginResponse);
        _getUser();
        return Right(loginResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else return Left(ServerFailure());
  }

  Future<Either<Failure, LoginResponseModel>> _getUser() async{
    try{
      final result = await localLoginDataSource.getLoginUser();
      log('asdsad: ${result.username}');
      return Right(result);
    } on CacheException{
      return Left(ServerFailure());
    }

  }


}
