import 'package:expance_tracker/catagory_screen/catagory.dart';
import 'package:expance_tracker/screens/wedgets/bottamnavigationbar.dart';
import 'package:expance_tracker/transation_screens/transation.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  final pages = const [scr_tarnsations(), Scr_catagory()];
  static ValueNotifier<int> selectedindex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 106, 70, 70),
      bottomNavigationBar: const Expancebottamnavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedindex,
          builder: (context, updated, _) {
            return pages[updated];
          },
        ),
      ),
    );
  }
}
