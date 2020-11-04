import 'package:flutter/material.dart';

import './widgets/new_transcation.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [
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

  void _addTransaction(String title, double amount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTx);
    });
  }

  void _startAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.indigoAccent,
        fontFamily: 'Quicksand',
        textTheme: TextTheme(
          headline6: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
            ),
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Expenses Tracker'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startAddTransaction(context),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  child: Text('Charts'),
                ),
              ),
              TransactionList(_transactions),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Container(child: Icon(Icons.add)),
          onPressed: () => _startAddTransaction(context),
        ),
      ),
    );
  }
}
