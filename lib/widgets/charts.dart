import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      var total = 0.0;

      for (var trx in recentTransactions) {
        if (trx.date.day == weekday.day &&
            trx.date.month == weekday.month &&
            trx.date.year == weekday.year) {
          total += trx.amount;
        }
      }

      return {'day': DateFormat.E().format(weekday), 'amount': total};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [],
      ),
    );
  }
}
