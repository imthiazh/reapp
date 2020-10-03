import 'package:flutter/material.dart';

class AntiAlcoholics extends StatelessWidget {
  static const routeName = '/antialcoholicchewables';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anti-Alcoholic Chewables'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text('...'),
          ],
        ),
      ),
    );
  }
}
