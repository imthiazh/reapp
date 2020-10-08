import 'package:flutter/material.dart';
import 'package:reapp/screens/anti_alcohol_chew.dart';
import 'package:reapp/screens/call_center.dart';
import 'package:reapp/screens/health_routine.dart';
import 'package:reapp/screens/location_activity.dart';
import 'package:reapp/screens/myProgress.dart';
import 'package:reapp/screens/my_rewards.dart';
import 'package:reapp/screens/reward.dart';
import 'package:reapp/screens/update_stats.dart';

class MainDrawer extends StatelessWidget {
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
