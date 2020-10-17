import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Card(
              child: Text('Charts'),
            ),
            Card(
              child: Text('Lists'),
            ),
          ],
        ),
      ),
    );
  }
}
