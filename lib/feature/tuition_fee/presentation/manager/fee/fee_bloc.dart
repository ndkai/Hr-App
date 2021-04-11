import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/usecase/usecase.dart';
import 'package:fai_kul/feature/attendance_his/presentation/manager/attendance_his/attendance_his_bloc.dart';
import 'package:fai_kul/feature/tuition_fee/domain/entities/FeeSwagger.dart';
import 'package:fai_kul/feature/tuition_fee/domain/entities/fee.dart';
import 'package:fai_kul/feature/tuition_fee/domain/use_cases/get_student_fee.dart';
import 'package:meta/meta.dart';

part 'fee_event.dart';

part 'fee_state.dart';

class FeeBloc extends Bloc<FeeEvent, FeeState> {
  final GetStudentFee getStudentFee;

  FeeBloc({this.getStudentFee});
  @override
  FeeState get initialState => Empty();

  @override
  Stream<FeeState> mapEventToState(FeeEvent event) async* {
    if(event is GetFee){
      yield Loading();
      print("FeeStatefailureOrSuccess");
      final failureOrSuccess = await getStudentFee(NoParams());
      print("FeeStatefailureOrSuccess1");
      yield* _eitherLoadedOrErrorState(failureOrSuccess);
    }
  }


  Stream<FeeState> _eitherLoadedOrErrorState(
      Either<Failure, FeeSwagger> failureOrsuccess,
      ) async* {
       print("_eitherLoadedOrErrorState");
    yield failureOrsuccess.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (success) => Loaded(fee: success),
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
