part of 'fee_bloc.dart';

@immutable
abstract class FeeState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}


class Empty extends FeeState {}

class Loading extends FeeState {}

class Loaded extends FeeState {
  final FeeSwagger fee;
  Loaded({@required this.fee});

  @override
  List<Object> get props => [fee];
}

class Error extends FeeState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
