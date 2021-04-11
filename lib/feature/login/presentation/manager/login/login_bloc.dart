import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/usecase/usecase.dart';
import 'package:fai_kul/feature/login/data/models/login_response_model.dart';
import 'package:fai_kul/feature/login/domain/use_cases/get_current_user.dart';
import 'package:fai_kul/feature/login/domain/use_cases/login.dart';
import 'package:meta/meta.dart';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';

part 'login_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Something wrong! Try again';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Login login;
  final GetCurrentUser getCurrentUser;

  LoginBloc({Login lg, GetCurrentUser cu})
      : assert(lg != null),
        assert(cu != null),
        getCurrentUser = cu,
        login= lg;

  @override
  LoginState get initialState => Empty();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is IsLogin) {
      yield Loading();
      final result = await getCurrentUser(NoParams());
      yield* _eitherLoginOrErrorState(result);
    }

    if (event is LoginE) {
      yield Loading();
      final result = await login(
          LoginParams(email: event.email, pass: event.pass));
      yield* _eitherLoadedOrErrorState(result);
    }

    if (event is ClearE) {
      yield Empty();
    }
  }


  Stream<LoginState> _eitherLoadedOrErrorState(
      Either<Failure, LoginResponseModel> failureOrSuccess) async* {
    yield failureOrSuccess.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (res) => Loaded(loginResponse: res),
    );
  }

  Stream<LoginState> _eitherLoginOrErrorState(
      Either<Failure, LoginResponseModel> failureOrSuccess) async* {
    yield failureOrSuccess.fold(
          (failure) => NotLogin(),
          (res) => LoginAlready(),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }

}
