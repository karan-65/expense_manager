import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTranscation extends StatefulWidget {
  final Function addtx;

  NewTranscation(this.addtx);

  @override
  State<NewTranscation> createState() => _NewTranscationState();
}

class _NewTranscationState extends State<NewTranscation> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();
  DateTime _selecteddate;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addtx(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
    //it automatically closes popup screen after user enters data and submit
  }

  void _presentdatepicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickeddate) {
      if (pickeddate == null) {
        return;
      }
      setState(() {
        _selecteddate = pickeddate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(_selecteddate == null
                        ? "No date chosen! "
                        : DateFormat.yMd().format(_selecteddate)),
                  ),
                  FlatButton(
                    onPressed: _presentdatepicker,
                    textColor: Colors.blue,
                    child: Text(
                      "Select date",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              child: Text('Add Transaction'),
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}
