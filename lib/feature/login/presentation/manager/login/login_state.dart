part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Empty extends LoginState{}
class Loading  extends LoginState{}
class Loaded extends LoginState{
  final LoginResponseModel loginResponse;
  Loaded({this.loginResponse});

  @override
  // TODO: implement props
  List<Object> get props => [loginResponse];
}
class Error extends LoginState{
  final String message;
  Error({this.message});
  @override
  // TODO: implement props
  List<Object> get props => [message];
}
class LoginAlready extends LoginState{}
class NotLogin extends LoginState{}

