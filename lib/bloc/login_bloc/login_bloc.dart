import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_rating_app/shared_pref.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  SharedPref sharedPrefrences = SharedPref();
  LoginBloc() : super(LoginInitial()) {
    on<LoginClicked>((event, emit) {
      print(sharedPrefrences.getName());
      print(sharedPrefrences.getPassword());
      if (event.name == sharedPrefrences.getName() &&
          event.password == sharedPrefrences.getPassword()) {
      sharedPrefrences.setLogginStatus("LoggedIN");

        emit(LoggedIn());
      }else{

      emit(LoggedError());
      }
    });
    on<SignUpClicked>((event, emit) {
     try {sharedPrefrences.setEmail(event.email);
      sharedPrefrences.setName(event.name);
      sharedPrefrences.setPassword(event.password);
      sharedPrefrences.setPhoneNo(event.phoneNo);
      sharedPrefrences.setProffession(event.proffession);
      sharedPrefrences.setLogginStatus("LoggedIN");
      emit(SignUpComplete());}catch(e){
        print(e.toString());
        emit(SignUpError());
      }
    });
  }
}
