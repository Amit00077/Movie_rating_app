part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}
class LoginClicked extends LoginEvent{
  final String name;
  final String password;

  LoginClicked(this.name, this.password);
}
class SignUpClicked extends LoginEvent{
  final String name;
  final String password;
  final String email;
  final String phoneNo;
  final String proffession;

  SignUpClicked(this.name, this.password, this.email, this.phoneNo, this.proffession);
}
