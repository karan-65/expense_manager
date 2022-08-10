import 'package:expense_manager/models/transcations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TranscationList extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final List<transcations> transcation;
  final Function deletetx;

  TranscationList(this.transcation, this.deletetx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            elevation: 4,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(7),
                  child: FittedBox(
                      child: Text(
                    '₹${transcation[index].amount.toStringAsFixed(2)}',
                  )),
                ),
              ),
              title: Text(
                transcation[index].title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle:
                  Text(DateFormat.yMMMd().format(transcation[index].datetime)),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () => deletetx(transcation[index].id),
              ),
            ),
          );
        },
        itemCount: transcation.length,
      ),
    );
  }
}
