import 'package:flutter/material.dart';

class NewTranscation extends StatelessWidget {
  //intianlising the variables for input of user data
//that are the title and the amount
  String TitleInput;
  String AmountInput;

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
              onPressed: () {},
              textColor: Colors.blue,
              child: Text("Add transcation"),
            ),
          ],
        ),
      ),
    );
  }
}
