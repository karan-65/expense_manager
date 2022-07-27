import 'package:expense_manager/widgets/new_transcation.dart';
import 'package:flutter/material.dart';
import 'package:expense_manager/widgets/transcation_list.dart';
import 'package:expense_manager/models/transcations.dart';

class UserTranscation extends StatefulWidget {
  const UserTranscation({Key key}) : super(key: key);

  @override
  State<UserTranscation> createState() => _UserTranscationState();
}

class _UserTranscationState extends State<UserTranscation> {
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

  void _addnewtranscaations(String title, double amount) {
    final newtx = transcations(
        amount: amount,
        id: DateTime.now().toString(),
        datetime: DateTime.now(),
        title: title);

    setState(() {
      _transcartion.add(newtx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTranscation(_addnewtranscaations),
        TranscationList(_transcartion),
      ],
    );
  }
}
