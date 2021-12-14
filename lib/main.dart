// ignore_for_file: prefer_const_constructors

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
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: Column(
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
            Card(
              child: Text("List of TX"),
            )
          ],
        ));
  }
}
