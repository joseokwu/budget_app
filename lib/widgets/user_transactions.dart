import 'package:flutter/material.dart';
import 'new_Transactions.dart';
import 'transactions_list.dart';
import '../models/transactions.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transactions> _userTransactions = [
    Transactions(
        id: '1', title: 'New shoes', price: 52.99, date: DateTime.now()),
    Transactions(
        id: '2', title: 'New pants', price: 88.99, date: DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transactions(
        title: txTitle,
        price: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransactions(_addNewTransaction),
        TransactionsList(_userTransactions)
      ],
    );
  }
}
