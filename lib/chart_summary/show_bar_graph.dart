import 'package:expance_tracker/chart_summary/chart_summary.dart';
import 'package:expance_tracker/models/bar_graph/bardata.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

class Show_bar_graph extends StatelessWidget {
  // final double? maxY;
  // final double sunamount;
  // final double monamount;
  // final double tusamount;
  // final double wedamount;
  // final double thramount;
  // final double friamount;
  // final double satamount;

  const Show_bar_graph({
    super.key,
    // required this.maxY,
    // required this.sunamount,
    // required this.monamount,
    // required this.tusamount,
    // required this.wedamount,
    // required this.thramount,
    // required this.friamount,
    // required this.satamount,
  });

  @override
  Widget build(BuildContext context) {
    // Bardata mybardata = Bardata(
    //   sunamount: sunamount,
    //   monamount: monamount,
    //   tusamount: tusamount,
    //   wedamount: wedamount,
    //   thuamount: thramount,
    //   friamount: friamount,
    //   satamount: satamount,
    // );
    // mybardata.inilizedbardata();

    return BarChart(
      BarChartData(
        maxY: 100,
        minY: 0,
        
           
      ),
    );
  }
}
