// ignore_for_file: prefer_const_constructors
import 'package:expense_manager/widgets/chart.dart';
import 'package:expense_manager/widgets/new_transcation.dart';
import 'package:expense_manager/widgets/transcation_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_manager/models/transcations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homescreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class homescreen extends StatefulWidget {
  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  final List<transcations> _transcartion = [
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

  List<transcations> get _recenttransactions {
    return _transcartion.where((tx) {
      return tx.datetime.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addnewtranscaations(String title, double amount, DateTime chosendate) {
    final newtx = transcations(
        amount: amount,
        id: DateTime.now().toString(),
        datetime: chosendate,
        title: title);

    setState(() {
      _transcartion.add(newtx);
    });
  }

  void _startnewtranscation(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTranscation(_addnewtranscaations);
        });
  }

  void _deletetranscation(String id) {
    setState(() {
      _transcartion.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Manager"),
        actions: [
          IconButton(
              onPressed: () => _startnewtranscation(context),
              icon: Icon(Icons.add))
        ],
      ),
      // ignore: prefer_const_literals_to_create_immutables
      body: SingleChildScrollView(
        child: Column(children: [
          Chart(_recenttransactions),
          TranscationList(_transcartion, _deletetranscation),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startnewtranscation(context),
      ),
    );
  }
}
