import 'package:flutter/material.dart';

class MyProgress extends StatelessWidget {
  static const routeName = '/myprogress';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Progress'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text('My Progress :'),
          ],
        ),
      ),
    );
  }
}
