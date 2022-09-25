import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_rating_app/auth_screens/signup_page.dart';
import 'package:movie_rating_app/bloc/home_bloc/home_page_bloc.dart';
import 'package:movie_rating_app/bloc/login_bloc/login_bloc.dart';
import 'package:movie_rating_app/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController nameController;
  late final TextEditingController passwordController;
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    nameController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dynamic width = MediaQuery.of(context).size.width;
    final dynamic height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoggedError) {
            showFlushBar(message: "Invalid Credentials").show(context);
          } else if (state is LoggedIn) {
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BlocProvider(
                      create: (context) => HomePageBloc(),
                      child: HomePage(),
                    )));
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.05, vertical: height * 0.015),
            child: Form(
              key: _formkey,
              child: Column(children: [
                SizedBox(
                  height: height * 0.3,
                ),
                TextFormField(
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return "Please enter a valid name";
                    }
                    return null;
                  }),
                  controller: nameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(height * 0.02),
                    labelText: "Enter Username",
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "please enter the passord";
                    }
                    return null;
                  },
                  controller: passwordController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(height * 0.02),
                    labelText: "Enter password",
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        BlocProvider.of<LoginBloc>(context).add(LoginClicked(
                            nameController.text, passwordController.text));
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.05, vertical: height * 0.015),
                      child: const Text("Login"),
                    )),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BlocProvider(
                                create: (context) => LoginBloc(),
                                child: SignUpPage(),
                              )));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.05, vertical: height * 0.015),
                      child: const Text("Don't have an account? Click here"),
                    )),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Flushbar<dynamic> showFlushBar({required String message}) {
    return Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.all(10),
      backgroundColor: Colors.red,
      duration: const Duration(milliseconds: 1800),
      message: message,
      messageColor: Colors.white,
    );
  }
}
