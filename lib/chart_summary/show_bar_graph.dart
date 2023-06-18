import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Show_bar_graph extends StatelessWidget {
  const Show_bar_graph({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        maxY: 100,
        minY: 0,
      ),
    );
  }
}
