part of 'attendance_his_bloc.dart';

@immutable
abstract class AttendanceHisEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetListAH extends AttendanceHisEvent{
}

class GetListAHByPage extends AttendanceHisEvent{
    final String pageNumber;

    GetListAHByPage(this.pageNumber);

  @override
  // TODO: implement props
  List<Object> get props => [pageNumber];
}

class FilterAHEvent extends AttendanceHisEvent{
  final DateTime startDay;
  final DateTime endDay;
  final List<AttendanceHistory> list;

  FilterAHEvent(this.startDay, this.endDay, this.list);


  @override
  // TODO: implement props
  List<Object> get props => [startDay, endDay, list];
}

