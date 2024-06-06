import 'package:flutter/material.dart';

class NotificationOptionRow extends StatefulWidget {
  final String title;
  bool isEnabled;

  NotificationOptionRow({required this.title, this.isEnabled = false});

  @override
  _NotificationOptionRowState createState() => _NotificationOptionRowState();
}

class _NotificationOptionRowState extends State<NotificationOptionRow> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      trailing: Switch(
        value: widget.isEnabled,
        onChanged: (value) {
          setState(() {
            widget.isEnabled = value;
          });
        },
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notification Option Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Notification Options'),
        ),
        body: NotificationOptionRow(title: 'Recent book', isEnabled: false),
      ),
    );
  }
}
