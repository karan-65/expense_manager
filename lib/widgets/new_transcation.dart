import 'package:flutter/material.dart';

class NewTranscation extends StatelessWidget {
  String TitleInput;
  String AmountInput;
  final Function addtx;

  NewTranscation(this.addtx);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            TextField(
              onChanged: (val) {
                TitleInput = val;
              },
              decoration: InputDecoration(labelText: "Title"),
            ),
            TextField(
              onChanged: (val) {
                AmountInput = val;
              },
              decoration: InputDecoration(labelText: "Amount"),
            ),
            FlatButton(
              onPressed: () {
                addtx(TitleInput, double.parse(AmountInput));
              },
              textColor: Colors.blue,
              child: Text("Add transcation"),
            ),
          ],
        ),
      ),
    );
  }
}
