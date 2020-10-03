import 'package:flutter/material.dart';

class UpdateStats extends StatelessWidget {
  static const routeName = '/update';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Notes'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text('My Notes :'),
          ],
        ),
      ),
    );
  }
}
