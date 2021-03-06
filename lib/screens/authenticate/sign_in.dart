import 'package:flutter/material.dart';
import 'package:reapp/services/auth.dart';
import 'package:reapp/shared/constants.dart';
import 'package:reapp/shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  
  AuthService _authuser = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';


  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text("Sign In"),
        elevation: 0.00,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical:20.0, horizontal: 50.0),
        child: Form(
          key: _formkey, 
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: "Email"),
                validator: (val) {
                  return val.isEmpty ? 'Email empty' : null;
                },
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: "Password"),
                validator: (val) {
                  return val.isEmpty ? 'pass empty' : null;
                },
                obscureText: true,
                onChanged: (val){
                  setState(() {
                    password = val;
                  });
                }
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.red[400],
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white)
                ),
                onPressed: () async {
                  if(_formkey.currentState.validate()){
                    setState(() {
                      loading = true;
                    });
                    dynamic result = await _authuser.signInWithEmailAndPassword(email,password);
                    if(result==null){
                      setState(() {
                        loading = false;
                         error = 'Invalid Credentials';
                      });
                    }
                  }
                  else{
                    print("lol1234");
                  }
                },
              ),
              SizedBox(height: 10.0),
              Text(error)
            ],
          )
        )
      )
    );
  }
}