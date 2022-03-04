import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';

class TransactionsList extends StatelessWidget {
  final List<Transactions> transactions;

  TransactionsList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
        return Card(
          child: Row(children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 2)),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(
                '\$${tx.price}',
                style: TextStyle(fontSize: 20, color: Colors.purple),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text(tx.title,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple)),
                ),
                Container(
                    child: Text(
                  DateFormat.yMMMd().format(tx.date),
                  style: TextStyle(color: Colors.grey),
                ))
              ],
            )
          ]),
        );
      }).toList(),
    );
  }
}
