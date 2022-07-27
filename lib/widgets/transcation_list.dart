import 'package:flutter/material.dart';
import 'package:expense_manager/models/transcations.dart';
import 'package:intl/intl.dart';

class TranscationList extends StatefulWidget {
  @override
  State<TranscationList> createState() => _TranscationListState();
}

class _TranscationListState extends State<TranscationList> {
  final List<transcations> transcartion = [
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
    return Column(
      children: transcartion.map((tx) {
        return Card(
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.blue)),
                padding: EdgeInsets.all(10),
                // ignore: prefer_const_constructors
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                child: Text(
                  '\$${tx.amount}',
                  // ignore: prefer_const_constructors
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
                    // ignore: prefer_const_constructors
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat.yMMMd().format(tx.datetime),
                    style: const TextStyle(color: Colors.blueGrey),
                  ),
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
