part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoggedIn extends LoginState{}
class LoggedError extends LoginState{}

class SignUpComplete extends LoginState{}
class SignUpError extends LoginState{}