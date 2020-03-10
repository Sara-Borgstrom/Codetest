import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoanList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Loan List')),
      body: Container(
        margin: EdgeInsets.all(24),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Firstname and Lastname'),
              subtitle: Text('Loan'),
            )
          ],
        ),
      ),
    );
  }
}


