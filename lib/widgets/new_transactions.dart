import 'package:flutter/material.dart';

class NewTransactions extends StatelessWidget {
  final Function addNewTx;

  NewTransactions(this.addNewTx);

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      primary: Colors.purple,
                      side: BorderSide(color: Colors.purple)),
                  onPressed: () {
                    addNewTx(titleController.text,
                        double.parse(amountController.text));
                  },
                  child: Text('Add Item')),
            )
          ])),
    );
  }
}
