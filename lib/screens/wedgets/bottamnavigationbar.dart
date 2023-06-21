//import 'package:expance_tracker/chart_summary/show_bar_graph.dart';
import 'package:expance_tracker/screens/sereen_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//int currentIndex = pages.indexWhere((element) => element is Show_bar_graph);

bool showFab = true;

class Expancebottamnavigation extends StatelessWidget {
  const Expancebottamnavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Home.selectedindex,
      builder: (context, updated, _) {
        //showFab = updated != 2;

        return BottomNavigationBar(
          backgroundColor: const Color.fromARGB(241, 255, 255, 255),
          useLegacyColorScheme: true,
          selectedFontSize: 14.0,
          unselectedFontSize: 12.0,
          selectedLabelStyle: GoogleFonts.cinzel(fontWeight: FontWeight.bold),
          unselectedLabelStyle: GoogleFonts.cinzel(fontWeight: FontWeight.bold),
          selectedItemColor: const Color.fromARGB(255, 109, 61, 117),
          unselectedItemColor: const Color.fromARGB(255, 98, 95, 95),
          currentIndex: updated,
          onTap: (newvalue) {
            Home.selectedindex.value = newvalue;
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 30.0,
                color: Color.fromARGB(255, 30, 115, 69),
              ),
              label: 'Tansation',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category_outlined,
                size: 30.0,
                color: Color.fromARGB(255, 30, 115, 69),
              ),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.auto_graph_outlined,
                size: 30.0,
                color: Color.fromARGB(255, 30, 115, 69),
              ),
              label: "Chart",
            ),
          ],
        );
      },
    );
  }
}
