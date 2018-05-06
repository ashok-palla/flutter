import 'package:flutter/material.dart';
import 'package:merilytics/bar.dart';
import 'package:merilytics/har_bar.dart';
import './charts.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import './emp_list.dart';

class DonutPage extends StatefulWidget {
  DonutPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _DonutPageState createState() => new _DonutPageState();
}

class _DonutPageState extends State<DonutPage> {
  static List<charts.Series<LinearSales, int>> _createNewJoineesAndExitsData() {
    final data = [new LinearSales(0, 6), new LinearSales(1, 2)];

    return [
      new charts.Series<LinearSales, int>(
        id: 'newJoineesAndExists',
        domainFn: (LinearSales sales, _) => sales.text,
        measureFn: (LinearSales sales, _) => sales.value,
        data: data,
      )
    ];
  }

  static List<charts.Series<ClicksPerYear, String>>
      _createStreamWiseEmployeesData() {
    final data = [
      new ClicksPerYear('Business', 104, Colors.lightBlue),
      new ClicksPerYear('Tech.', 42, Colors.lightGreen),
      new ClicksPerYear('Network', 5, Colors.limeAccent),
      new ClicksPerYear('Recruitment', 15, Colors.amber),
    ];
    return [
      new charts.Series(
          id: 'stream',
          domainFn: (ClicksPerYear clickData, _) => clickData.year,
          measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
          colorFn: (ClicksPerYear clickData, _) => clickData.color,
          data: data,
          labelAccessorFn: (ClicksPerYear clickData, _) => clickData.year),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text(widget.title)),
        body: new ListView(
          children: <Widget>[
            new Card(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: const Icon(Icons.group),
                    title: const Text('Total employees count'),
                    subtitle: const Text('as of today'),
                    isThreeLine: true,
                  ),
                  new SizedBox(
                    height: 100.0,
                    child: new Center(
                      child: new Text(
                        '#147',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 100.0,
                            color: Colors.lightBlue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Card(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: const Icon(Icons.insert_chart),
                    title: const Text('Employees count by stream'),
                    subtitle: const Text('as of today'),
                    isThreeLine: true,
                  ),
                  new SizedBox(
                    height: 300.0,
                    child: new HorizontalBarLabelChart.withSampleData(),
                  ),
                  new ButtonTheme.bar(
                    // make buttons use the appropriate styles for cards
                    child: new ButtonBar(
                      children: <Widget>[
                        new FlatButton(
                          child: const Text('View List'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => TestList()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            new Card(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: const Icon(Icons.data_usage),
                    title: const Text('New joinees and exits'),
                    subtitle: const Text('within next 30 days'),
                    isThreeLine: true,
                  ),
                  new SizedBox(
                    height: 300.0,
                    child: new DonutPieChart(
                      _createNewJoineesAndExitsData(),
                      animate: true,
                      arcWidth: 50,
                    ),
                  ),
                ],
              ),
            ),
            new Card(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: const Icon(Icons.insert_chart),
                    title: const Text('Employees count by stream'),
                    subtitle: const Text('as of today'),
                    isThreeLine: true,
                  ),
                  new SizedBox(
                    height: 300.0,
                    child: new BarChart(
                      _createStreamWiseEmployeesData(),
                      animate: true,
                      vertical: false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
