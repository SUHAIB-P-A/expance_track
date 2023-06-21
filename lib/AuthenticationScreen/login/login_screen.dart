import 'package:expance_tracker/AuthenticationScreen/sign_up/signup_screen.dart';
import 'package:expance_tracker/Database/authentication_db/signup.dart';
import 'package:expance_tracker/models/authentication/authentication_model.dart';
import 'package:expance_tracker/screens/sereen_home.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class loginsrc extends StatefulWidget {
  loginsrc({super.key});

  static const routename = "login-screen";

  @override
  State<loginsrc> createState() => _loginsrcState();
}

class _loginsrcState extends State<loginsrc> {
//gradient effect of front login screen text
  final Shader linearGradient = const LinearGradient(
    colors: <Color>[
      Color.fromARGB(255, 32, 238, 35),
      Color.fromARGB(255, 16, 190, 217),
      Color.fromARGB(255, 220, 42, 191)
    ],
  ).createShader(const Rect.fromLTWH(10.0, 10.0, 250.0, 90.0));

  final _emaileditcontrol = TextEditingController();

  final _passwordeditcontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
      body: FlipCard(
        alignment: Alignment.center,
        direction: FlipDirection.VERTICAL,
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
              'assets/images/87845-hello.json',
              repeat: false,
            ),
            Container(
              width: 150,
              height: 90,
              decoration: const BoxDecoration(
                color: Color.fromARGB(0, 0, 0, 0),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
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
            color: Color.fromARGB(0, 0, 0, 0),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _emaileditcontrol,
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
                child: TextFormField(
                  controller: _passwordeditcontrol,
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
                onPressed: () {
                  checkloginorhome1();
                  
                  checkvaluesfrominput_to_db();
                },
                child: const Text(
                  'login',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Need an account?',
                    style: GoogleFonts.cinzel(
                        textStyle: const TextStyle(color: Colors.white)),
                  ),
                  TextButton(
                    style: const ButtonStyle(
                      mouseCursor: MaterialStateMouseCursor.clickable,
                    ),
                    onPressed: () {
                      
                      Navigator.of(context)
                          .pushReplacementNamed(signupsrc.routename);
                    },
                    child: const Text(
                      'Signup',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkvaluesfrominput_to_db() async {
    final _email = _emaileditcontrol.text;
    final _password = _passwordeditcontrol.text;
    if (_email.isEmpty) {
      return;
    }
    if (_password.isEmpty) {
      return;
    }
    List<AuthenticationModel> db_values = await getlogindetails();
    for (var item in db_values) {
      if ((_email == item.email) && (_password == item.password)) {
        Navigator.of(context).pushReplacementNamed(Home.routename);
        break;
      } else {
        var snackBar = const SnackBar(
          width: 200,
          duration: Duration(milliseconds: 1000),
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          behavior: SnackBarBehavior.floating,
          padding: EdgeInsets.all(10.0),
          content: Text(
            "wrong userid or password",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  Future<void> checkloginorhome1() async {
//save data

    final shareduser = await SharedPreferences.getInstance();
    var inl = await shareduser.setString("username", _emaileditcontrol.text);

    // final sharedpass = await SharedPreferences.getInstance();
    // await sharedpass.setString("password", _passcontroller.text);
  }
}
