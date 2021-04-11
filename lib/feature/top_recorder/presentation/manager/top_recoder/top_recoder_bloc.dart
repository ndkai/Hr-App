import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/usecase/usecase.dart';
import 'package:fai_kul/feature/attendance_his/presentation/manager/attendance_his/attendance_his_bloc.dart';
import 'package:fai_kul/feature/top_recorder/domain/entities/toprecorder_swagger.dart';
import 'package:fai_kul/feature/top_recorder/domain/use_cases/get_top_recorder_data.dart';
import 'package:meta/meta.dart';

part 'top_recoder_event.dart';

part 'top_recoder_state.dart';

class TopRecoderBloc extends Bloc<TopRecoderEvent, TopRecoderState> {
  final GetTopRecorderUsecase getTopRecorderUsecase;

  TopRecoderBloc({this.getTopRecorderUsecase});
  @override
  TopRecoderState get initialState => Empty();

  @override
  Stream<TopRecoderState> mapEventToState(TopRecoderEvent event) async* {
    if (event is GetTopRecoderEvent) {
      yield Loading();
      print("xxxxx");
      final result =  await getTopRecorderUsecase(NoParams());

      yield* _eitherLoadedOrErrorState(result);
    }
  }

  Stream<TopRecoderState> _eitherLoadedOrErrorState(
      Either<Failure, TopRecorderSwagger> failureOrsuccess,
      ) async* {
                 print("chay khogn ta");
    yield failureOrsuccess.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (success) => Loaded(topRecorderSwagger: success),
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
