import 'package:expance_tracker/catagory_screen/expance_cat_list.dart';
import 'package:expance_tracker/catagory_screen/income_cat_list.dart';
import 'package:flutter/material.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabcontroller1,
          tabs: const [
            Tab(
              text: 'incom',
            ),
            Tab(
              text: 'expance',
            ),
          ],
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
