import 'package:flutter/material.dart';

class transcations {
  final String id;
  final String title;
  final double amount;
  final DateTime datetime;
  transcations(
      {@required this.amount,
      @required this.id,
      @required this.datetime,
      @required this.title});
}
