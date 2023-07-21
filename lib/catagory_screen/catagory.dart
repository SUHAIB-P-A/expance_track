import 'package:expance_tracker/Database/category_db/db_category.dart';
import 'package:expance_tracker/catagory_screen/expance_cat_list.dart';
import 'package:expance_tracker/catagory_screen/income_cat_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Scr_catagory extends StatefulWidget {
  const Scr_catagory({super.key});

  @override
  State<Scr_catagory> createState() => _Scr_catagoryState();
}

class _Scr_catagoryState extends State<Scr_catagory>
    with SingleTickerProviderStateMixin {
  late TabController _tabcontroller1;

  @override
  void initState() {
    _tabcontroller1 = TabController(length: 2, vsync: this);
    catagory_db().refreshUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          labelStyle: GoogleFonts.cinzel(fontWeight: FontWeight.bold),
          controller: _tabcontroller1,
          tabs: const [
            Tab(
              text: 'Income',
            ),
            Tab(
              text: 'Expense',
            ),
          ],
          indicator: const ShapeDecoration(
            shape: UnderlineInputBorder(
              borderSide: BorderSide(width: 8.0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(50, 360),
                topRight: Radius.elliptical(50, 360),
              ),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabcontroller1,
            children: const [
              Income(),
              expance(),
            ],
          ),
        ),
      ],
    );
  }
}
