import 'package:flutter/material.dart';

class MyRewards extends StatelessWidget {
  static const routeName = '/myrewards';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Rewards'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text('My Rewards :'),
          ],
        ),
      ),
    );
  }
}
