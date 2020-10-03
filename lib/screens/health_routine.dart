import 'package:flutter/material.dart';

class HealthRoutine extends StatelessWidget {
  static const routeName = '/healthroutine';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Routine'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text('Health Routine :'),
          ],
        ),
      ),
    );
  }
}
