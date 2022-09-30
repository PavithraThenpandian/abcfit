import 'package:flutter/material.dart';
import 'package:abc_fit/sevices/notification.dart';

class Lodingpage extends StatefulWidget {
  @override
  _LodingpageState createState() => _LodingpageState();
  Lodingpage();
}

class _LodingpageState extends State<Lodingpage> {
  @override
  void initState() {
    super.initState();
    localNotification.setOnNotifiactionReceive(onNotifiactionReceive);
    localNotification.setOnNotificationClick(onNotificationClik);
    note();
  }

  Future<void> note() async {
    await localNotification.showNotification();
  }

  onNotifiactionReceive(ReceiveNotification notification) {
    print('received ${notification.id}');
  }

  onNotificationClik(String payload) {
    print('payload$payload');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlatButton(
        child: Text('click'),
        onPressed: () async {
          print(TimeOfDay.now().hour);
        },
      ),
    );
  }
}
