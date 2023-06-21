import 'package:expance_tracker/AuthenticationScreen/login/login_screen.dart';
import 'package:expance_tracker/Database/authentication_db/signup.dart';
import 'package:expance_tracker/models/authentication/authentication_model.dart';
import 'package:expance_tracker/screens/sereen_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSpalsh extends StatefulWidget {
  const ScreenSpalsh({super.key});

  @override
  State<ScreenSpalsh> createState() => _ScreenSpalshState();
}
var user_name;
class _ScreenSpalshState extends State<ScreenSpalsh> {
  @override
  void initState() {
    
    usergetval();
    print(user_name);
    gotohome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(115, 253, 252, 252),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/images/23917-loading-screen-pink.json'),
          Text(
            '"You can make money two \n \tways make more, or \n \tspend less."',
            textAlign: TextAlign.center,
            style: GoogleFonts.satisfy(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  Future<void> gotohome() async {
    
    await Future.delayed(
      const Duration(seconds: 5),
    );
    if (user_name == null) {
      Navigator.of(context).pushReplacementNamed(loginsrc.routename);
    } else {
      Navigator.of(context).pushReplacementNamed(Home.routename);
    }
  }
  Future<void> usergetval() async {
  final user = await SharedPreferences.getInstance();
  final saved_user = user.getString("username");
   user_name = saved_user;
}

}
