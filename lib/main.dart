// ignore_for_file: prefer_const_constructors

import './transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // const MyHomePage({Key? key}) : super(key: key);

  final List<Transaction> transactions = [
    Transaction(
      id: "t1",
      title: "New Books",
      amount: 100,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Transport Fare",
      amount: 65.99,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                child: Container(
                  color: Colors.blue,
                  child: Text("CHART!"),
                ),
                elevation: 5,
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.blueAccent, width: 2)),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "\$${tx.amount.toString()}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.blueAccent),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(tx.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17)),
                          Text(tx.date.toString(),
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ));
  }
}
