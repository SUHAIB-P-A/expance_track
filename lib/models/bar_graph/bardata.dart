import 'package:expance_tracker/models/bar_graph/graph_pos_amount.dart';

class Bardata {
  final double sunamount;
  final double monamount;
  final double tusamount;
  final double wedamount;
  final double thuamount;
  final double friamount;
  final double satamount;

  Bardata({
    required this.sunamount,
    required this.monamount,
    required this.tusamount,
    required this.wedamount,
    required this.thuamount,
    required this.friamount,
    required this.satamount,
  });

  List<individualbars> databars = [];

  void inilizedbardata() {
    databars = [
      //sun
      individualbars(x: 0, y: sunamount),

      //sun
      individualbars(x: 1, y: monamount),

      //sun
      individualbars(x: 2, y: tusamount),

      //sun
      individualbars(x: 3, y: wedamount),

      //sun
      individualbars(x: 4, y: thuamount),

      //sun
      individualbars(x: 5, y: friamount),

      //sun
      individualbars(x: 6, y: satamount),
    ];
  }
}
