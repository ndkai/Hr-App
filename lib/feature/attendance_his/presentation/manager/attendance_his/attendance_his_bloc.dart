import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/usecase/usecase.dart';
import 'package:fai_kul/core/utils/input_converter.dart';
import 'package:fai_kul/feature/attendance_his/data/models/attendance_history_swagger.dart';
import 'package:fai_kul/feature/attendance_his/data/models/data.dart';
import 'package:fai_kul/feature/attendance_his/domain/use_cases/get_attendance_history_by_page.dart';
import 'package:fai_kul/feature/attendance_his/domain/use_cases/get_attendence_history.dart';
import 'package:meta/meta.dart';
import 'dart:developer';
part 'attendance_his_event.dart';

part 'attendance_his_state.dart';
const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class AttendanceHisBloc extends Bloc<AttendanceHisEvent, AttendanceHisState> {
  final InputConverter inputConverter;
  final GetAttendanceHistory getAttendanceHistory;
  final GetAttendanceHistoryByPage getAttendanceHistoryByPage;

  AttendanceHisBloc({
  @required this.inputConverter,
  @required GetAttendanceHistory ah,
  @required GetAttendanceHistoryByPage ahbp,
  }) :  assert(ah != null),
        assert(ahbp != null),
        assert(inputConverter != null),
        getAttendanceHistory = ah,
        getAttendanceHistoryByPage = ahbp;
  @override
  AttendanceHisState get initialState => Empty();

  @override
  Stream<AttendanceHisState> mapEventToState(AttendanceHisEvent event) async* {
    if(event is GetListAHByPage){
       final inputEither = inputConverter.stringToUnsignedInteger(event.pageNumber);
       yield* inputEither.fold(
           (failure) async* {
             yield Error(message: INVALID_INPUT_FAILURE_MESSAGE);
           },
           (integer) async* {
             yield Loading();
             final result = await getAttendanceHistoryByPage(Params(pageNumber: integer));
             yield* _eitherLoadedOrErrorState(result);
           });
    } else

    if(event is GetListAH){
      yield Loading();
      final failureOrSuccess = await getAttendanceHistory(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrSuccess);
    } else

    if(event is FilterAHEvent){
      yield Loading();
      yield* _processListHisX(event.startDay, event.endDay, event.list);
    }
  }

  Stream<AttendanceHisState> _eitherLoadedOrErrorState(
      Either<Failure, AttendanceHistorySwagger> failureOrsuccess,
      ) async* {

    yield failureOrsuccess.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (success) => Loaded(attendanceHistories: success.data),
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

  Stream<AttendanceHisState> _processListHisX(DateTime st, DateTime ed, List<AttendanceHistory> list) async*{
    List<AttendanceHistory> l = new List<AttendanceHistory>();
    try{

      for(AttendanceHistory items in list){
        if(DateTime.parse(items.ngayGioChamCong).compareTo(st) >= 0
            && DateTime.parse(items.ngayGioChamCong).compareTo(ed) <= 0){
          l.add(items);
          print("123111");
        }
      }
     print('xxxxxxx:${l.length}');
      if(l.length <= 0) {
        yield Error(message: "");
      } else
      yield  FilterAHState(attendanceHistories: l);
    } catch(e){
      print("_processListHisX: ${e.toString()}");
      yield Error(message: "Empty");
    }


  }
}
