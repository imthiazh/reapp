import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reapp/screens/anti_alcohol_chew.dart';
import 'package:reapp/screens/call_center.dart';
import 'package:reapp/screens/health_routine.dart';
import 'package:reapp/screens/location_activity.dart';
import 'package:reapp/screens/myProgress.dart';
import 'package:reapp/screens/my_rewards.dart';
import 'package:reapp/screens/reward.dart';
import 'package:reapp/screens/update_stats.dart';
import 'dart:convert';
import 'package:http/http.dart' as http; 

class MainDrawer extends StatefulWidget {

  

  // MainDrawer(this.username_val,this.email_val);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {


  String email_val;
  String username_val;

  Future<void> getResponse() async{
  final FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseUser user_i = await auth.currentUser();
    String uid2 = user_i.uid;
    // String uid2 = uid;
    print("UID is:" + uid2);
    print("hello");
      String url = "https://reapp-4a214.firebaseio.com/userdata/"+uid2+".json";
      // const url = "https://reapp-4a214.firebaseio.com/products.json";
      // onError2(){
      //   return;
      // };
      dynamic rs = await http.get(url);
      
      print(json.decode(rs.body));
      json_rs=json.decode(rs.body) as Map<String, dynamic>;
      json_rs.forEach((prodId, prodData) {
        email_val = prodData['email'];
        username_val = prodData['username'];
      });
      // List<Transaction> rewards_collected=[];
      // json_rs.forEach((prodId, prodData) {
      //   print("Data is"+prodData['reward_title']+prodData['reward_cost'].toString());
      //   rewards_collected.add(Transaction(
      //     id: prodId,
      //     title: prodData['reward_title'],
      //     amount: prodData['reward_cost'],
      //     date: DateTime.parse(prodData['timestamp']),
      //     progress: 0.00
      //   ));
      // });
      // transactions = rewards_collected;
      // print("Added Amount is:" + transactions[0].amount.toString());
      
}
  var _isLoading = false;
  dynamic json_rs;

  @override
  void initState(){
    setState(() {
      _isLoading = true;
    });
    getResponse().then((value) {
      setState(() {
      _isLoading=false;  
      });
    });
    super.initState();
  }

  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          /*Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),*/
          SizedBox(
            height: 40,
          ),
          _isLoading ? CircularProgressIndicator() : Row(
            children: [
              SizedBox(width: 10,),
              Icon(Icons.person, size: 60.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(username_val, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  Text(email_val),
                ]
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          // Text(widget.email_val),
          
          
          buildListTile('My Rewards', Icons.card_giftcard, () {
            
            Navigator.of(context).pushNamed(MyRewards.routeName);
          }),
          buildListTile('My Notes', Icons.work, () {
            Navigator.of(context).pushNamed(UpdateStats.routeName);
          }),
          buildListTile('My Health Routine', Icons.favorite, () {
            Navigator.of(context).pushNamed(HealthRoutine.routeName);
          }),
          buildListTile('My Progress', IconData(58400, fontFamily: 'MaterialIcons'), () {
            Navigator.of(context).pushNamed(MyProgress.routeName);
          }),
          
          buildListTile('Location Activity', IconData(0xe0c8, fontFamily: 'MaterialIcons'), () {
            Navigator.of(context).pushNamed(LocationActivity.routeName);
          }),
          
          buildListTile('Anti-Alcoholic Chewables', Icons.fastfood, () {
            Navigator.of(context).pushNamed(AntiAlcoholics.routeName);
          }),
          // buildListTile(
          //   'Reward',
          //   Icons.card_giftcard,
          //   () {
          //     Navigator.of(context).pushNamed(Reward.routeName);
          //   },
          // ),
        ],
      ),
    );
  }
}
