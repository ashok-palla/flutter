import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class DonutPieChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;
  final num arcWidth;

  DonutPieChart(this.seriesList, {this.animate, this.arcWidth});

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart<LinearSales, int>(seriesList,
        animate: animate,
        defaultRenderer: new charts.ArcRendererConfig(arcWidth: arcWidth));
  }
}

class LinearSales {
  final int text;
  final int value;

  LinearSales(this.text, this.value);
}
