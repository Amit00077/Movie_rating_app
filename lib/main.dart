import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_rating_app/auth_screens/login_page.dart';
import 'package:movie_rating_app/auth_screens/signup_page.dart';
import 'package:movie_rating_app/bloc/home_bloc/home_page_bloc.dart';
import 'package:movie_rating_app/bloc/login_bloc/login_bloc.dart';
import 'package:movie_rating_app/homepage.dart';
import 'package:movie_rating_app/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPref().init().then((value) => runApp(
        MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  SharedPref sharedPrefrences = SharedPref();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(),
          ),
          BlocProvider<HomePageBloc>(
            create: (context) => HomePageBloc(),
          ),
        ],
        child: sharedPrefrences.getLogginStatus() == "LoggedIN"
            ? LoginPage()
            : SignUpPage(),
      ),
    );
  }
}
