import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:emoji_feedback/emoji_feedback.dart';
import '../models/user_notes.dart';

class UpdateStats extends StatelessWidget {
  static const routeName = '/update';

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  //TextEditingController _controller = TextEditingController();
  var _formData = UserNotes(
      consumedLitres: 0.0,
      moneySpent: 0.0,
      days: 0.0,
      weight: 0.0,
      height: 0.0,
      sleep: 0.0,
      exerciseDuration: 0.0);

  void _saveForm() {
    final isValid = _fbKey.currentState
        .validate(); //to trigger all the validators in the various text field
    if (!isValid) {
      //only if all validators return null,isValid will be true.
      return;
    }
    _fbKey.currentState.save();
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
                          _formData = UserNotes(
                            consumedLitres: double.parse(value),
                            moneySpent: _formData.moneySpent,
                            days: _formData.days,
                            weight: _formData.weight,
                            height: _formData.height,
                            sleep: _formData.sleep,
                            exerciseDuration: _formData.exerciseDuration,
                          );
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
                            _formData = UserNotes(
                              consumedLitres: _formData.consumedLitres,
                              moneySpent: double.parse(value),
                              days: _formData.days,
                              weight: _formData.weight,
                              height: _formData.height,
                              sleep: _formData.sleep,
                              exerciseDuration: _formData.exerciseDuration,
                            );
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
                            _formData = UserNotes(
                              consumedLitres: _formData.consumedLitres,
                              moneySpent: _formData.moneySpent,
                              days: double.parse(value),
                              weight: _formData.weight,
                              height: _formData.height,
                              sleep: _formData.sleep,
                              exerciseDuration: _formData.exerciseDuration,
                            );
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
                            _formData = UserNotes(
                              consumedLitres: _formData.consumedLitres,
                              moneySpent: _formData.moneySpent,
                              days: _formData.days,
                              weight: double.parse(value),
                              height: _formData.height,
                              sleep: _formData.sleep,
                              exerciseDuration: _formData.exerciseDuration,
                            );
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
                            _formData = UserNotes(
                              consumedLitres: _formData.consumedLitres,
                              moneySpent: _formData.moneySpent,
                              days: _formData.days,
                              weight: _formData.weight,
                              height: double.parse(value),
                              sleep: _formData.sleep,
                              exerciseDuration: _formData.exerciseDuration,
                            );
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
                            _formData = UserNotes(
                              consumedLitres: _formData.consumedLitres,
                              moneySpent: _formData.moneySpent,
                              days: _formData.days,
                              weight: _formData.weight,
                              height: _formData.height,
                              sleep: double.parse(value),
                              exerciseDuration: _formData.exerciseDuration,
                            );
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
                            _formData = UserNotes(
                              consumedLitres: _formData.consumedLitres,
                              moneySpent: _formData.moneySpent,
                              days: _formData.days,
                              weight: _formData.weight,
                              height: _formData.height,
                              sleep: _formData.sleep,
                              exerciseDuration: double.parse(value),
                            );
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
