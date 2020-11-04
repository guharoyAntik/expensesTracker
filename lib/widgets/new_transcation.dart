import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  void submitData() {
    String inputTitle = titleController.text;
    double inputAmount = double.parse(amountController.text);

    if (inputAmount.isNegative || inputTitle.isEmpty) {
      return;
    }

    addTransaction(
      inputTitle,
      inputAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              onPressed: submitData,
              child: Text(
                'Add tranction',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
