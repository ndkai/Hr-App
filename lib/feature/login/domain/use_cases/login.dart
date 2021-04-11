import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/usecase/usecase.dart';
import 'package:fai_kul/feature/login/data/models/login_response_model.dart';
import 'package:fai_kul/feature/login/domain/repositories/login_response_repository.dart';
import 'package:flutter/widgets.dart';

//mỗi use case chứa 1 method sử dụng để tương tác vs ui
class Login implements UseCase<LoginResponseModel, LoginParams>{
  final LoginResponseRepository repository;

  Login(this.repository);

  @override
  Future<Either<Failure, LoginResponseModel>> call(LoginParams params) async {
    // TODO: implement call
    return await repository.login(params.email, params.pass);
  }
}


class LoginParams extends Equatable {
  final String email;
  final String pass;

  LoginParams({@required this.email, @required this.pass});

  @override
  // TODO: implement props
  List<Object> get props => [email, pass];
}