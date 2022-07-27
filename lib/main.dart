// ignore_for_file: prefer_const_constructors
import 'package:expense_manager/transcations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  //list view of transcations
  List<transcations> transcartion = [
    transcations(
        id: "t1",
        title: "shoes shopping",
        amount: 45,
        datetime: DateTime.now()),
    transcations(
        id: "t2",
        title: "clothes shopping",
        amount: 41,
        datetime: DateTime.now()),
  ];

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
        Card(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "Title"),
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Amount"),
                ),
                FlatButton(
                  onPressed: () {},
                  textColor: Colors.blue,
                  child: Text("Add transcation"),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: transcartion.map((tx) {
            return Card(
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.blue)),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                    child: Text(
                      '\$${tx.amount}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue),
                    ),
                  ),
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tx.title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat.yMMMd().format(tx.datetime),
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    ],
                  )
                ],
              ),
            );
          }).toList(),
        )
      ]),
    );
  }
}
