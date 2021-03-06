import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:emoji_feedback/emoji_feedback.dart';

class UpdateStats extends StatefulWidget {
  static const routeName = '/update';

  @override
  _UpdateStatsState createState() => _UpdateStatsState();
}

class _UpdateStatsState extends State<UpdateStats> {
  double consumedLitres;

  double moneySpent;

  double days;

  double weight;

  double height;

  double sleep;

  double exerciseDuration;

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  Future<void> _saveForm() async {
    final isValid = _fbKey.currentState
        .validate(); //to trigger all the validators in the various text field
    if (!isValid) {
      //only if all validators return null,isValid will be true.
      return;
    }
    _fbKey.currentState.save();
    final FirebaseAuth auth = FirebaseAuth.instance;
    // var DBref = FirebaseDatabase.instance.reference();
    FirebaseUser user = await auth.currentUser();
    String uid2 = user.uid;
    // String uid2 = uid;
    // print("UID is:" + uid2);
    // print("hello");
    void inputData() async {
      String url = "https://reapp-4a214.firebaseio.com/userstats/"+uid2+".json";
      // const url = "https://reapp-4a214.firebaseio.com/products.json";
          http.post(url, body: json.encode({
            "consumedLitres":consumedLitres,
            "moneySpent":moneySpent,
            "days":days,
            "weight":weight,
            "height":height,
            "sleep":sleep,
            "exerciseDuration":exerciseDuration,
            "timestamp":DateTime.now().toString()
          }));

        if(consumedLitres>0){
          String url1 = "https://reapp-4a214.firebaseio.com/last_consumed/"+uid2+".json";
        // const url = "https://reapp-4a214.firebaseio.com/products.json";
            http.post(url1, body: json.encode({
              "timestamp":DateTime.now().toString()
            }));
        }

        String url3 = "https://reapp-4a214.firebaseio.com/last_consumed/"+uid2+".json";
        // const url = "https://reapp-4a214.firebaseio.com/products.json";
          dynamic resp = await http.get(url3);
          // dynamic json_resp;
          print(json.decode(resp.body));
          resp=json.decode(resp.body) as Map<String, dynamic>;
          int count = 0;
          String last_date;
          // print(json_resp['timestamp']);
          resp.forEach((prodId, prodData) {
            last_date = prodData['timestamp'];
          });
          // String last = json_resp[count]['timestamp'];
          print(last_date);
      }
      inputData();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Notes'),
      ),
      body: FormBuilder(
        key: _fbKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Text('How much alcohol did you consume today ?',
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                      FormBuilderSlider(
                        attribute: 'slider',
                        min: 0,
                        max: 10,
                        initialValue: 0,
                        onSaved: (value) {
                          consumedLitres = double.parse(value.toString());
                          print(value);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('How much did you spend on alcohol today ?',
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                      FormBuilderTextField(
                          attribute: 'textfield',
                          maxLines: 1,
                          validators: [
                            //FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                          ],
                          keyboardType: TextInputType.number,
                          onSaved: (value) {
                            moneySpent = double.parse(value.toString());
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'How many days have you gone without alcohol ?',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      FormBuilderTouchSpin(
                          attribute: 'touch_spin',
                          initialValue: 1,
                          step: 1,
                          onSaved: (value) {
                            days = double.parse(value.toString());
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Enter your weight in kilograms',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      FormBuilderTextField(
                          attribute: 'textfield',
                          maxLines: 1,
                          validators: [
                            //FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                          ],
                          keyboardType: TextInputType.number,
                          onSaved: (value) {
                            weight = double.parse(value.toString());
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Enter your height in centimetres',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      FormBuilderTextField(
                          attribute: 'textfield',
                          maxLines: 1,
                          validators: [
                            //FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                          ],
                          keyboardType: TextInputType.number,
                          onSaved: (value) {
                            height = double.parse(value.toString());
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'How many hours did you sleep yesterday ?',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      FormBuilderTouchSpin(
                          attribute: 'touch_spin',
                          initialValue: 1,
                          step: 1,
                          onSaved: (value) {
                            sleep = double.parse(value.toString());
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'How many minutes did you workout today ?',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      FormBuilderTextField(
                          attribute: 'textfield',
                          maxLines: 1,
                          validators: [
                            FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                            FormBuilderValidators.maxLength(3),
                          ],
                          keyboardType: TextInputType.number,
                          onSaved: (value) {
                            exerciseDuration = double.parse(value.toString());
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'How are you feeling today ?',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      EmojiFeedback(
                        onChange: (index) {
                          print(index);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Tell us how you feel',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      FormBuilderTextField(
                        attribute: 'textfield',
                        maxLines: 3,
                        validators: [
                          FormBuilderValidators.required(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  RaisedButton(
                    child: Text('Submit'),
                    onPressed: _saveForm,
                  ),
                  RaisedButton(
                    child: Text('Reset'),
                    onPressed: () {
                      _fbKey.currentState.reset();
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}