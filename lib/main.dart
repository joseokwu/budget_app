import 'package:flutter/material.dart';
import './transactions.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transactions> transactions = [
    Transactions(id: 1, title: 'New shoes', price: 52.99, date: DateTime.now()),
    Transactions(id: 2, title: 'New pants', price: 88.99, date: DateTime.now()),
  ];

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                elevation: 5,
                child: Text('Charts'),
              ),
            ),
            Card(
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
                          style: OutlinedButton.styleFrom(primary: Colors.purple, side: BorderSide(color: Colors.purple)),
                          onPressed: () {
                            print(titleController.text);
                          },
                          child: Text('Add Item')),
                    )
                  ])),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Row(children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2)),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
            )
          ],
        ));
  }
}
