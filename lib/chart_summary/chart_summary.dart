// import 'dart:async';

// import 'package:expance_tracker/chart_summary/show_bar_graph.dart';
// import 'package:expance_tracker/models/transations/transation_model.dart';
 import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// ignore: camel_case_types
class Expanse_Chart_Summary extends StatelessWidget {
  final DateTime? startofweek;
  const Expanse_Chart_Summary({
    super.key,
    required this.startofweek,
  });

  @override
  Widget build(BuildContext context) {
    return Placeholder();
    // return Consumer<TransationModel>(
    //   builder: (context, value, child) {
    //    return const SizedBox(
    //       height: 20,
    //       child: Show_bar_graph(
    //         maxY: 100,
    //         sunamount: 20,
    //         monamount: 5,
    //         tusamount: 52,
    //         wedamount: 23,
    //         thramount: 89,
    //         friamount: 6,
    //         satamount: 47,
    //       ),
    //     );
    //   },
    // );
  }
}
