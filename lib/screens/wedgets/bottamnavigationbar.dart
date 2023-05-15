import 'package:expance_tracker/screens/sereen_home.dart';
import 'package:flutter/material.dart';

class Expancebottamnavigation extends StatelessWidget {
  const Expancebottamnavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Home.selectedindex,
      builder: (context, updated, _) {
        return BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 108, 79, 69),
          mouseCursor: MouseCursor.uncontrolled,
          useLegacyColorScheme: true,
          showSelectedLabels: false,
          showUnselectedLabels: true,
          selectedItemColor: const Color.fromARGB(255, 109, 61, 117),
          unselectedItemColor: const Color.fromARGB(255, 98, 95, 95),
          currentIndex: updated,
          onTap: (newvalue) {
            Home.selectedindex.value = newvalue;
          },
          elevation: 10.0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'tansation',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              label: 'category',
            )
          ],
        );
      },
    );
  }
}
