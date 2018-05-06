import 'package:flutter/material.dart';
import 'package:merilytics/device_info.dart';
import './asset.dart';
import './donut.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Merilytics',
      theme: new ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: new MyHomePage(title: 'Merilytics'),
    );
  }
}

enum EmpStatus { active, inActive }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // void _incrementCounter() {
  //   setState(() {});
  // }
  Map _employeeDetails = {
    'name': 'Jaykumar Bidarkar',
    'email': 'jaykumar@merilytics.com'
  };
  @override
  Widget build(BuildContext context) {
    avatarPictureText(_name) {
      List<String> nameSplitArray = _name.toString().split(' ');
      String avatarText = '';
      for (final nameChunk in nameSplitArray) {
        avatarText += nameChunk.toString().substring(0, 1).toUpperCase();
      }
      return avatarText;
    }

    _navigateScreens(BuildContext context, String screenName) {
      Navigator.pop(context);
      switch (screenName) {
        case 'Merilytics':
          Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new MyHomePage(title: screenName)),
          );
          break;
        case 'Asset Tracking':
          Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => Asset(title: screenName)),
          );
          break;
        case 'Employee Dashboard':
          Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new DonutPage(title: screenName)),
          );
          break;
        case 'Device Info':
          Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new DeviceInfo()),
          );
          break;
        default:
          Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new MyHomePage(title: screenName)),
          );
      }
    }

    return new Scaffold(
      appBar: new AppBar(title: new Text(widget.title), actions: <Widget>[
        new PopupMenuButton<EmpStatus>(
            itemBuilder: (BuildContext context) => <PopupMenuItem<EmpStatus>>[
                  const PopupMenuItem<EmpStatus>(
                      value: EmpStatus.active, child: const Text('Active')),
                  const PopupMenuItem<EmpStatus>(
                      value: EmpStatus.inActive, child: const Text('Inactive'))
                ],
            onSelected: (EmpStatus action) {
              switch (action) {
                case EmpStatus.active:
                  // setState(null);
                  break;
                case EmpStatus.inActive:
                  // setState(null);
                  break;
              }
            })
      ]),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                currentAccountPicture: new CircleAvatar(
                  child: new Text(avatarPictureText(_employeeDetails['name'])),
                ),
                accountName: new Text(_employeeDetails['name']),
                accountEmail: new Text(_employeeDetails['email'])),
            new ListTile(
              leading: new Icon(Icons.group),
              title: new Text('Employee Dashboard'),
              onTap: () => _navigateScreens(context, 'Employee Dashboard'),
            ),
            new ListTile(
              leading: new Icon(Icons.track_changes),
              title: new Text('Asset Tracking'),
              onTap: () => _navigateScreens(context, 'Asset Tracking'),
            ),
            new ListTile(
              leading: new Icon(Icons.info),
              title: new Text('Device Info'),
              onTap: () => _navigateScreens(context, 'Device Info'),
            )
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: new Text("Total employee count"),
            subtitle: new Text('180'),
          ),
          new Divider(),
          new ListTile(
            title: new Text("Business"),
            subtitle: new Text('100'),
          ),
          new ListTile(
            title: new Text("Tech"),
            subtitle: new Text("70"),
          ),
          new ListTile(
            title: new Text("Support"),
            subtitle: new Text("10"),
          ),
          new Divider(),
          new ListTile(
            title: new Text("Employees to join in next 30 days"),
            subtitle: new Text('7'),
          ),
          new ListTile(
            title: new Text("Employees to exitin next 30 days"),
            subtitle: new Text('3'),
          ),
          new Divider()
        ],
      ),
    );
  }
}
