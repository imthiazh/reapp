import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:reapp/models/transaction.dart';
import 'package:reapp/widgets/full_user_transaction.dart';
import 'package:reapp/widgets/inputForm.dart';
import 'package:reapp/widgets/listTransaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http; 

void main() => runApp(MyRewards());

class MyRewards extends StatelessWidget {
  
  static const routeName = '/updatestats';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

dynamic json_rs;
var _isInit = true;
var _isLoading = false;

Future<void> getResponse() async{
  final FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseUser user_i = await auth.currentUser();
    String uid2 = user_i.uid;
    // String uid2 = uid;
    print("UID is:" + uid2);
    print("hello");
      String url = "https://reapp-4a214.firebaseio.com/rewards/"+uid2+".json";
      // const url = "https://reapp-4a214.firebaseio.com/products.json";
      // onError2(){
      //   return;
      // };
      dynamic rs = await http.get(url);
      
      print(json.decode(rs.body));
      json_rs=json.decode(rs.body) as Map<String, dynamic>;
      List<Transaction> rewards_collected=[];
      json_rs.forEach((prodId, prodData) {
        print("Data is"+prodData['reward_title']+prodData['reward_cost'].toString());
        rewards_collected.add(Transaction(
          id: prodId,
          title: prodData['reward_title'],
          amount: prodData['reward_cost'],
          date: DateTime.parse(prodData['timestamp']),
          progress: 0.00
        ));
      });
      transactions = rewards_collected;
      print("Added Amount is:" + transactions[0].amount.toString());
      // setState(){};
      
      // setState(() {
      // });
      // http.get(url).then((rs) {
      //   print(json.decode(rs.body));
      //   json_rs=json.decode(rs.body);
      // });
      // // print(json_rs);

      //     // final response = await http.get(url);
          
      // });
}

@override
void initState() {
    // TODO: implement initState
    super.initState();
}

void didChangeDependencies(){
  if(_isInit){
    setState(() {
      _isLoading = true;
    });
    getResponse().then((value) {
      setState(() {
      _isLoading=false;  
      });
    });
  }
  _isInit=false;
  super.didChangeDependencies();
  // final FirebaseAuth auth = FirebaseAuth.instance;
  // FirebaseUser user_i;
  // auth.currentUser().then((user_i){
  //   String uid2 = user_i.uid;
  //   // String uid2 = uid;
  //   print("UID is:" + uid2);
  //   print("hello");
  //     String url = "https://reapp-4a214.firebaseio.com/rewards/"+uid2+".json";
  //     // const url = "https://reapp-4a214.firebaseio.com/products.json";
  //     dynamic response;
      
  //     http.get(url).then((rs) {
  //       print(json.decode(rs.body));
  //       json_rs=json.decode(rs.body);
  //     });
  //     // print(json_rs);

  //         // final response = await http.get(url);
          
  //     });
  }

  

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();
  // }

// Future<void> inputData() async {
// final FirebaseAuth auth = FirebaseAuth.instance;
// super.initState();
//   String uid;
//     try {
//       auth.currentUser().then((userId) { //I've removed the 'widget.'
//         uid = userId.uid;
//         setState(() {
//           AuthStatus authStatus =
//               userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
//         });
//       });
//     } catch (e) {}

  
//     // var DBref = FirebaseDatabase.instance.reference();
//     FirebaseUser user_i;
//     auth.currentUser().then((user) => user_i = user);
//     // FirebaseUser user = await 
//     String uid2 = user_i.uid;
//     // String uid2 = uid;
//     print("UID is:" + uid2);
//     print("hello");
//       String url = "https://reapp-4a214.firebaseio.com/rewards/"+uid2+".json";
//       // const url = "https://reapp-4a214.firebaseio.com/products.json";
//           final response = await http.get(url);
//           print("Response is:"+json.decode(response.body).toString());
//       }

// @override
//   void initState() {
//     // TODO: implement initState
    
    
//     inputData();
//     super.initState();
//   }

void _addTx(String title1, double amount2){
  Transaction newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title1,
      amount: amount2,
      date: DateTime.now(),
      progress: 0.00
    );

  setState(() {
    transactions.add(newTransaction);
  });
}

List<Transaction> transactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Weekly Groceries',
    //   amount: 16.53,
    //   date: DateTime.now(),
    // ),
  ];

  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_) {
      return GestureDetector(
          onTap: () {},
          child: InputForm(_addTx),
          behavior: HitTestBehavior.opaque,
        );
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Rewards'),
        // leading: IconButton (
        //   icon: Icon(Icons.arrow_back),
        //   onPressed:() => Navigator.pop(context)
        // ),),
      ),
      body: _isLoading ? Center(child: CircularProgressIndicator()) : SingleChildScrollView(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.all(10),
                  // child: Text(,
                  //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  // ),
                )
              ),
              ListTransaction(transactions)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>
          _startAddNewTransaction(context)
      ),
    );
  }
}
