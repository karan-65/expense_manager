// ignore_for_file: prefer_const_constructors
import 'package:expense_manager/widgets/transcation_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homescreen(),
    );
  }
}

class homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expense Manager")),
      // ignore: prefer_const_literals_to_create_immutables
      body: Column(children: [
        Card(
          child: Container(
            width: double.infinity,
            child: Text("chart"),
          ),
        ),
        TranscationList(),
      ]),
    );
  }
}
