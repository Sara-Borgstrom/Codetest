import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoanForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return FormScreenState();
  }
}

class FormScreenState extends State<LoanForm> {
  String _firstName;
  String _lastName;
  String _email;
  String _loanAmount;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'First name'),
      maxLength: 50,
      validator: (String value){
        if(value.isEmpty){
          return 'Name is Required';
        }
      },
      onSaved: (String value) {
        _firstName = value;
      },
    );
  }
  Widget _buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Last name'),
      maxLength: 50,
      validator: (String value){
        if(value.isEmpty){
          return 'Name is Required';
        }
      },
      onSaved: (String value) {
        _lastName = value;
      },
    );
  }
  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      // ignore: missing_return
      validator: (String value){
        if(value.isEmpty){
          return 'Name is Required';
        }
        if(!RegExp(
        "[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
            .hasMatch(value)) {
          return 'Please enter a vaild email adress';
        }
        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }
  Widget _buildLoanAmountField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Loan amount'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        int loan =int.tryParse(value);
        if(loan < 9999){
          return 'Loan amount have to be more then 10000';
        } else if(loan > 500000){
          return 'Amount may not be more then 500000';
        } else if(loan == null){
          return 'Please enter an Amount';
        }
        },
      onSaved: (String value) {
        _loanAmount = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Loan')),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildFirstNameField(),
              _buildLastNameField(),
              _buildEmailField(),
              _buildLoanAmountField(),
              SizedBox(height: 100),
              RaisedButton(
                child: Text('Submit',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 16
                  ),
                ),
                onPressed: () {
                  if(!_formKey.currentState.validate()){
                    return;
                  }
                 _formKey.currentState.save();

                  print(_firstName);
                  print(_lastName);
                  print(_email);
                  print(_loanAmount);

                },
              )
            ],
        ),
          ),),
      ),
    );
  }
}