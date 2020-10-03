import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:reapp/screens/home/user_data_display.dart';
import 'package:reapp/screens/home/user_intro.dart';
import 'package:reapp/services/auth.dart';
import 'package:reapp/services/database.dart';
import 'package:flutter/rendering.dart';
import 'package:reapp/screens/anti_alcohol_chew.dart';
import 'package:reapp/screens/call_center.dart';
import 'package:reapp/screens/reward.dart';
import 'package:reapp/screens/update_stats.dart';
import 'package:reapp/widgets/main_drawer.dart';

class Home extends StatelessWidget {
  AuthService _auth = AuthService();
  
  @override
  Widget build(BuildContext context) {

    Widget imageCarousel = Container(
      height: 300.0,
      child: Carousel(
        boxFit: BoxFit.cover, //image takes the full box
        images: [
          AssetImage('assets/images/img_carousel_1.jpg'),
          AssetImage('assets/images/img_carousel_2.jpg'),
          AssetImage('assets/images/img_carousel_3.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastLinearToSlowEaseIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 5.0,
      ),
    );

    // return StreamProvider<QuerySnapshot>.value(
    //     value: DatabaseService().user_data_stream,
    //     child: Scaffold(
    //     backgroundColor: Colors.red[100],
    //     appBar: AppBar(
    //       title: Text("Home Page"),
    //       backgroundColor: Colors.red[400],
    //       elevation: 0.00,
        //   actions: <Widget>[
        //     FlatButton.icon(
        //       onPressed: () {
        //         _auth.signOut();
        //       },
        //       icon: Icon(Icons.person),
        //       label: Text("Logout"))
        //   ],
        // ),
    //     //body: UserDataDisplay()
    //     body: UserIntro()
    //   ),
    // );
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().user_data_stream,
      child: Scaffold(
      appBar: AppBar(
        title: Text('Reapp'),
        actions: <Widget>[
            FlatButton.icon(
              onPressed: () {
                _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text("Logout"))
          ],
        ),
      drawer: MainDrawer(),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: <Widget>[
      //       UserIntro(),
      //       SizedBox(height: 20.0),
      //       Center(
      //         child: Card(
      //           child: InkWell(
      //             splashColor: Colors.blue.withAlpha(30),
      //             onTap: () {
      //               print('Card tapped.');
      //             },
      //             child: Container(
      //               width: 300,
      //               height: 100,
      //               child: Text(
      //                 'Days gone without alcohol : x',
      //                 style:
      //                     TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //       Text(
      //         'Motivation : dont drink alcohol coz its bad',
      //         style: TextStyle(
      //             fontWeight: FontWeight.bold,
      //             color: Colors.blue,
      //             fontSize: 20),
      //       ),
      //     ],
      //   ),
      // ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            imageCarousel,
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                  width: double.infinity,
                  height: 40,
                  child: Text('Progress to next reward:',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: new LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2500,
                percent: 0.8,
                center: Text("80.0%"),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.green,
              ),
            ),
            UserIntro(),
              SizedBox(height: 20.0),
              Center(
                child: Card(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      print('Card tapped.');
                    },
                    child: Container(
                      width: 300,
                      height: 100,
                      child: Text(
                        'Days gone without alcohol : x',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    )
    );
  }
}