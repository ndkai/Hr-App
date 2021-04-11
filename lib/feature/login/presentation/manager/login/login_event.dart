part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginE extends LoginEvent{
  final String email;
  final String pass;

  LoginE(this.email, this.pass);
  @override
  // TODO: implement props
  List<Object> get props => [email, pass];

}

class ClearE extends LoginEvent{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class IsLogin extends LoginEvent{
  @override
  // TODO: implement props
  List<Object> get props => [];
}


