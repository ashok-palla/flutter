import 'package:flutter/material.dart';
import './main.dart';

class TestList extends StatefulWidget {
  TestList();
  @override
  _TestListState createState() => new _TestListState();
}

class _TestListState extends State<TestList> {
  bool loading = true;
  List<Widget> listArray = [];
  List<Contact> value = [
    new Contact(name: 'Employee 1', designation: 'Designation', stream: 'Tech'),
    new Contact(name: 'Employee 2', designation: 'Designation', stream: 'Tech'),
    new Contact(name: 'Employee 3', designation: 'Designation', stream: 'Tech'),
    new Contact(name: 'Employee 4', designation: 'Designation', stream: 'Tech'),
    new Contact(name: 'Employee 5', designation: 'Designation', stream: 'Tech'),
    new Contact(name: 'Employee 6', designation: 'Designation', stream: 'Tech'),
    new Contact(name: 'Employee 7', designation: 'Designation', stream: 'Tech'),
    new Contact(name: 'Employee 8', designation: 'Designation', stream: 'Tech'),
    new Contact(name: 'Employee 9', designation: 'Designation', stream: 'Tech'),
    new Contact(name: 'Employee 10', designation: 'Designation', stream: 'Tech'),
    new Contact(name: 'Employee 11', designation: 'Designation', stream: 'Tech'),
    new Contact(name: 'Employee 12', designation: 'Designation', stream: 'Tech'),
    new Contact(name: 'Employee 13', designation: 'Designation', stream: 'Tech')
  ];
  _TestListState() {
    for (var i = 0; i < value.length; i++) {
      listArray.add(
        new ListTile(
          title: new Text(value[i].name),
          subtitle: new Text(value[i].designation),
          trailing: new IconButton(
            icon: new Icon(Icons.info),
            onPressed: () => Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => MyHomePage(title: 'Merilytics')),
                ),
          ),
          leading: new CircleAvatar(
            child: new Icon(Icons.person),
          ),
        ),
      );
      listArray.add(new Divider());
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: new Text('Employee List')),
      body: new ListView(children: listArray),
    );
  }
}

class Contact {
  final name;
  final designation;
  final stream;
  Contact({this.name, this.designation, this.stream});
}
