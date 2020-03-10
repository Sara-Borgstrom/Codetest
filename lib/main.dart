import 'package:code_test/models/application.dart';
import 'package:flutter/material.dart';
import 'package:code_test/models/loanlist.dart';
import 'package:code_test/models/loanform.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}
  class _MyAppState extends State<MyApp> {
    int _currentIndex = 0;
    Widget callPage(int currentIndex){
switch (currentIndex) {
  case 0: return LoanForm();
  case 1: return LoanList();
  break;
  default:
}
    }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
           primarySwatch: Colors.green,
            ), 
            home: Scaffold(
              body: callPage(_currentIndex),
              bottomNavigationBar: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  onTap: (value){
                    _currentIndex=value;
                    setState(() {

                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.assessment),
                      title: Text('New Loan'),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.list),
                      title: Text('Loan List'),
                    ),
                  ],
                ),
            ),

            );
        }
  }
      
        text(String s) {}

