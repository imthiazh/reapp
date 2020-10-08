import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
    title: "Cálculo do Tempo de Serviço",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  MaskedTextController initialDate = MaskedTextController(mask: "00/00/0000");
  MaskedTextController finalDate = MaskedTextController(
      mask: "00/00/0000",
      text: new DateFormat("ddMMyyyy").format(DateTime.now()));

  String _result = "Waiting for values";

  void _getDifference() {
    setState(() {
      DateTime inicial = DateTime.parse(_convertDateString(initialDate.text));
      DateTime finalD = DateTime.parse(_convertDateString(finalDate.text));
      Duration difference = finalD.difference(inicial);

      int years = (difference.inDays / 365).truncate();
      int restYears = difference.inDays % 365;
      int months = (restYears / 30).truncate();
      // int days = restYears % 30;

      int a = DateTime.parse("2020-01-10 08:25:00")
          .difference(DateTime.parse("2020-01-05 00:00:00"))
          .inDays;

      int b = (DateTime.parse("2020-01-10 08:25:00")
          .difference(DateTime.parse("2020-01-05 00:00:00"))
          .inHours);
      if (a > 0) {
        b = b % 24;
      }
      int c = (DateTime.parse("2020-01-10 08:25:00")
          .difference(DateTime.parse("2020-01-05 00:00:00"))
          .inMinutes);
      if (b > 0) {
        c = c % 60;
      }

      int d = (DateTime.now()
          .difference(DateTime.parse("2020-10-06 09:22:00"))
          .inDays);

      _result = "$a days, $b hours, $c minutes... $d dayzz";
    });
  }

  void _resetFields() {
    initialDate.updateText("");
    finalDate.updateText(new DateFormat("ddMMyyyy").format(DateTime.now()));
    setState(() {
      _result = "Waiting for values";
    });
  }

  String _convertDateString(String dateString) {
    return dateString.split("/").reversed.join("-");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Date Difference Calculator",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.access_time,
                color: Colors.deepPurple,
                size: 50.0,
              ),
              TextFormField(
                controller: initialDate,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Enter valid date!";
                  }
                },
                decoration: InputDecoration(
                    labelText: "Initial Date:",
                    labelStyle: TextStyle(color: Colors.deepPurple)),
              ),
              TextFormField(
                controller: finalDate,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Enter valid date!";
                  }
                },
                decoration: InputDecoration(
                    labelText: "Final Date:",
                    labelStyle: TextStyle(color: Colors.deepPurple)),
              ),
              Container(
                height: 150,
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: OutlineButton(
                  child: Text(
                    "Calculate Difference",
                    style: TextStyle(color: Colors.deepPurple, fontSize: 20.0),
                  ),
                  onPressed: () {
                    print(DateTime.parse("2020-01-10 00:00:00.299871")
                        .difference(
                            DateTime.parse("2020-01-05 00:00:00.299871"))
                        .inDays);
                    if (_formKey.currentState.validate()) {
                      _getDifference();
                    }
                  },
                  borderSide: BorderSide(color: Colors.deepPurple),
                ),
              ),
              Text(
                "$_result",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.deepPurple, fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
