import 'package:reapp/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ListTransaction extends StatelessWidget {
  
  final List<Transaction> transactions;

  ListTransaction(this.transactions);

  


  @override
  Widget build(BuildContext context) {
    print("Amount is:"+transactions[0].amount.toString());
    return Container(
              height: 500,
              child: ListView(
              children: 
                transactions.map((tx) {
                  return Container(
                    child: Card(
                      elevation: 10,
                      color: Colors.white,
                      // child: Text(tx.title, style: TextStyle(color: Colors.white),),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue,
                                width: 2
                              ),                            
                            ),
                            padding: EdgeInsets.all(10),
                            child: Text('\$${tx.amount.toStringAsFixed(2)}', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                            ),)
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                            Text(tx.title, 
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),),
                            // Text(DateFormat.yMMMd().format(tx.date),
                            //   style: TextStyle(
                            //     color: Colors.black,
                            // ),),
                            SizedBox(
                              height: 5,
                            ),
                            LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width - 150,
                              animation: true,
                              lineHeight: 15.0,
                              animationDuration: 2500,
                              percent: 0.8,
                              center: Text("80.0%"),
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: Colors.blue,
                            ),
                          ],)
                        ],
                      ),
                    ),
                  );
                }).toList()
            ),
          );
  }
}