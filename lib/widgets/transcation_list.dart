import 'package:expense_manager/models/transcations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TranscationList extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final List<transcations> transcation;

  TranscationList(this.transcation);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
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
                    '\$${transcation[index].amount.toStringAsFixed(2)}',
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
                      transcation[index].title,
                      // ignore: prefer_const_constructors
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat.yMMMd().format(transcation[index].datetime),
                      style: const TextStyle(color: Colors.blueGrey),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: transcation.length,
      ),
    );
  }
}
