import 'package:expance_tracker/AuthenticationScreen/login/login_screen.dart';
import 'package:expance_tracker/Database/authentication_db/signup.dart';
import 'package:expance_tracker/models/authentication/authentication_model.dart';
import 'package:expance_tracker/screens/sereen_home.dart';
import 'package:expance_tracker/transation_screens/transation.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

// ignore: camel_case_types
class signupsrc extends StatelessWidget {
  signupsrc({super.key});

  final emaileditingcontroller = TextEditingController();
  final passwordeditingcontroller = TextEditingController();

  static const routename = "signup-screen";

//gradient effect of front login screen text
  final Shader linearGradient = const LinearGradient(
    colors: <Color>[
      Color.fromARGB(255, 32, 238, 35),
      Color.fromARGB(255, 16, 190, 217),
      Color.fromARGB(255, 220, 42, 191)
    ],
  ).createShader(const Rect.fromLTWH(10.0, 10.0, 250.0, 90.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Card(
        elevation: 0.0,
        margin: const EdgeInsets.only(
            left: 50.0, right: 32.0, top: 100.0, bottom: 0.0),
        color: const Color.fromARGB(0, 0, 0, 0),
        child: FlipCard(
          alignment: Alignment.center,
          direction: FlipDirection.HORIZONTAL,
          side: CardSide.FRONT,
          speed: 1000,
          onFlipDone: (status) {
            print(status);
          },
          front: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Lottie.asset(
                'assets/images/111225-add-new-user.json',
                height: 200,
                width: 200,
                repeat: false,
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                width: 150,
                height: 90,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'signup',
                      style: GoogleFonts.abrilFatface(
                        textStyle: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()..shader = linearGradient,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          back: Container(
            width: 300,
            height: 500,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 0, 0, 0),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  //email************
                  child: TextFormField(
                    controller: emaileditingcontroller,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5.0),
                      filled: true,
                      fillColor: Colors.white24,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  //password*********
                  child: TextFormField(
                    controller: passwordeditingcontroller,
                    obscureText: true,
                    obscuringCharacter: '*',
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5.0),
                      filled: true,
                      fillColor: Colors.white24,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(144, 255, 255, 255))),
                  onPressed: () async {
                    bool empty = await clearauth();
                    final _email = emaileditingcontroller.text;
                    final _password = passwordeditingcontroller.text;
                    if (_email.isEmpty) {
                      return;
                    }
                    if (_password.isEmpty) {
                      return;
                    }
                    List<AuthenticationModel> db_values =
                        await getlogindetails();
                    if (!empty) {
                      for (var item in db_values) {
                        if ((_email == item.email) &&
                            (_password == item.password)) {
                          checkvaluesfrominput_to_db_signup(context);
                          break;
                        }
                      }
                    } else {
                      addlogindata();
                      Navigator.of(context)
                          .pushReplacementNamed(Home.routename);
                    }
                  },
                  child: const Text(
                    'signup',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'already have an account?',
                      style: GoogleFonts.cinzel(
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(loginsrc.routename);
                      },
                      child: const Text('Login'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addlogindata() async {
    final _email = emaileditingcontroller.text;
    final _password = passwordeditingcontroller.text;
    if (_email.isEmpty) {
      return;
    }
    if (_password.isEmpty) {
      return;
    }
    final _loginmodel = AuthenticationModel(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      email: _email,
      password: _password,
    );
    addlogindetails(_loginmodel);
  }

  Future<void> checkvaluesfrominput_to_db_signup(BuildContext context) async {
    var snackBar = const SnackBar(
      width: 200,
      duration: Duration(milliseconds: 1000),
      backgroundColor: Color.fromARGB(255, 62, 196, 32),
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.all(10.0),
      content: Text(
        "aldrady a account here",
        textAlign: TextAlign.center,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
