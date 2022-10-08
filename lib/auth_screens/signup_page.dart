import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_rating_app/bloc/home_bloc/home_page_bloc.dart';
import 'package:movie_rating_app/bloc/login_bloc/login_bloc.dart';
import 'package:movie_rating_app/homepage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final TextEditingController nameController;
  late final TextEditingController passwordController;
  late final TextEditingController emailController;
  late final TextEditingController phoneNoController;
  late final TextEditingController proffessionController;
  final List<String> proffession = ["Teacher", "Vlogger", "Doctor", "Engineer"];

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    nameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    phoneNoController = TextEditingController();
    proffessionController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    phoneNoController.dispose();
    proffessionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dynamic width = MediaQuery.of(context).size.width;
    final dynamic height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is SignUpError) {
            showFlushBar(message: "Something went wrong").show(context);
          } else if (state is SignUpComplete) {
            Navigator.pop(context);
            Navigator.pop(context);

            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>  BlocProvider(
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
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return "Please enter a valid email";
                    }
                    return null;
                  }),
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(height * 0.02),
                    labelText: "Enter email",
                  ),
                ),
                TextFormField(
                  validator: ((value) {
                    if (value!.isEmpty && value.length > 10) {
                      return "Please enter a valid phone number";
                    }
                    return null;
                  }),
                  controller: phoneNoController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(height * 0.02),
                    labelText: "Enter Phone Number",
                  ),
                ),
                DropdownButtonFormField(
                  hint: const Text(
                    "Proffession",
                    style: TextStyle(
                        color: Colors.black, overflow: TextOverflow.ellipsis),
                  ),
                  isDense: true,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: width * 0.04, right: 5),
                  ),
                  items: proffession.map((e) {
                    return DropdownMenuItem<String>(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      proffessionController.text = value.toString();
                    });
                  },
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "please enter the passord";
                    }
                    return null;
                  },
                  obscureText: true,
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
                        BlocProvider.of<LoginBloc>(context).add(SignUpClicked(
                            nameController.text,
                            passwordController.text,
                            emailController.text,
                            phoneNoController.text,
                            proffessionController.text));
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.05, vertical: height * 0.015),
                      child: const Text("SignUp"),
                    ))
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
