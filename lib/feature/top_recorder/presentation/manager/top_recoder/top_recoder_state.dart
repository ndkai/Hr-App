part of 'top_recoder_bloc.dart';

@immutable
abstract class TopRecoderState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Empty extends TopRecoderState{}

class Loading extends TopRecoderState{}

class Loaded extends TopRecoderState{
  final TopRecorderSwagger topRecorderSwagger;

  Loaded({this.topRecorderSwagger});
  @override
  // TODO: implement props
  List<Object> get props => [topRecorderSwagger];
}

class Error extends TopRecoderState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
