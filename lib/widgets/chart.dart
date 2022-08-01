import 'package:expense_manager/models/transcations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<transcations> recenttranscations;

  Chart(this.recenttranscations);

  List<Map<String, Object>> get groupedtranscations {
    return List.generate(
      7,
      (index) {
        final weekday = DateTime.now().subtract(
          Duration(days: index),
        );
        var totalsum = 0.0;
        for (var i = 0; i < recenttranscations.length; i++) {
          if (recenttranscations[i].datetime.day == weekday.day &&
              recenttranscations[i].datetime.month == weekday.month &&
              recenttranscations[i].datetime.year == weekday.year) {
            totalsum += recenttranscations[i].amount;
          }
        }
        return {'days': DateFormat.E(weekday), 'amount': totalsum};
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Row(),
    );
  }
}
