import 'package:expance_tracker/AuthenticationScreen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ScreenSpalsh extends StatefulWidget {
  const ScreenSpalsh({super.key});

  @override
  State<ScreenSpalsh> createState() => _ScreenSpalshState();
}

class _ScreenSpalshState extends State<ScreenSpalsh> {
  @override
  void initState() {
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
          const Text('"You can make money two \n \tways make more, or \n \tspend less."',textAlign: TextAlign.center,)
        ],
      ),
    );
  }

  Future<void> gotohome() async {
    await Future.delayed(
      const Duration(seconds: 5),
    );
    Navigator.of(context).pushNamed(loginsrc.routename);
  }
}
