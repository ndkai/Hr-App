part of 'attendance_his_bloc.dart';

@immutable
abstract class AttendanceHisState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}


class Empty extends AttendanceHisState {}

class Loading extends AttendanceHisState {}

class Loaded extends AttendanceHisState {
  final List<AttendanceHistory> attendanceHistories;
  Loaded({@required this.attendanceHistories});

  @override
  List<Object> get props => [attendanceHistories];
}

class Error extends AttendanceHisState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}

class FilterAHState extends AttendanceHisState {
  final List<AttendanceHistory> attendanceHistories;

  FilterAHState({@required this.attendanceHistories});

  @override
  List<Object> get props => [attendanceHistories];
}