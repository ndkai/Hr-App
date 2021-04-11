import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/feature/login/data/models/login_response_model.dart';

abstract class LoginResponseRepository{
  Future<Either<Failure, LoginResponseModel>>  login(String email, String pass);

  Future<Either<Failure, LoginResponseModel>>  getCurrentUser();
}