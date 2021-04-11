part of 'fee_bloc.dart';

@immutable
abstract class FeeEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetFee extends FeeEvent{
}
