import 'package:expance_tracker/Database/authentication_db/signup.dart';
import 'package:expance_tracker/models/authentication/authentication_model.dart';
import 'package:expance_tracker/screens/sereen_home.dart';
import 'package:expance_tracker/transation_screens/transation.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Card(
        elevation: 0.0,
        margin: const EdgeInsets.only(
            left: 50.0, right: 32.0, top: 100.0, bottom: 0.0),
        color: const Color.fromARGB(225, 255, 255, 255),
        child: FlipCard(
          alignment: Alignment.center,
          direction: FlipDirection.HORIZONTAL,
          side: CardSide.FRONT,
          speed: 1000,
          onFlipDone: (status) {
            print(status);
          },
          front: Container(
            width: 300,
            height: 500,
            decoration: const BoxDecoration(
              color: Color(0xFF006666),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'SIGNUP',
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()..shader = linearGradient),
                )
              ],
            ),
          ),
          back: Container(
            width: 300,
            height: 500,
            decoration: const BoxDecoration(
              color: Color(0xFF006666),
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
                      hintText: 'Email',
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
                  onPressed: () {
                    addlogindata();
                    Navigator.of(context).pushNamed(Home.routename);
                  },
                  child: const Text(
                    'signup',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
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
}
