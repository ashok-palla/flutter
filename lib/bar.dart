import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;
  final bool vertical;

  BarChart(this.seriesList, {this.animate, this.vertical});
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: new EdgeInsets.all(32.0),
      child: new charts.BarChart<ClicksPerYear>(
        seriesList,
        animate: animate        
      ),
    );
  }
}

class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = new charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
