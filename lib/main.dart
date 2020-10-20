import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'Milk',
      amount: 60,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Biscuits',
      amount: 30,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Expenses Tracker'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                elevation: 5,
                child: Text('Charts'),
              ),
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Amount',
                      ),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        'Add tranction',
                        style: TextStyle(color: Colors.teal),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: transactions.map((tx) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.teal),
                        ),
                        child: Text(
                          '₹: ${tx.amount}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            DateFormat.yMMMd().format(tx.date),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
