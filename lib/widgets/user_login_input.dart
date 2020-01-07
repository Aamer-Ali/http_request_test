import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_request_test/screens/home_page.dart';
import 'dart:io' show Platform;

class UserLoginInput extends StatefulWidget {
  final Function _loginUser;

  UserLoginInput(this._loginUser);

  @override
  State<StatefulWidget> createState() {
    return UserLoginInputState();
  }
}

class UserLoginInputState extends State<UserLoginInput> {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;

    var _formKey = GlobalKey<FormState>();

    TextEditingController userController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Form(
      key: _formKey,
      child: Center(
        child: Container(
          margin: EdgeInsets.only(top: 25),
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: userController,
                style: textStyle,
                validator: (String val) {
                  if (val.isEmpty) {
                    return 'Please enter username';
                  }
                },
                decoration: InputDecoration(
                  labelText: 'UserName',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                style: textStyle,
                validator: (String val) {
                  if (val.isEmpty) {
                    return 'Please enter passowrd';
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Passowrd',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Platform.isIOS
                  ? CupertinoButton(
                      child: Text('Login'),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          widget._loginUser(
                              userController.text, passwordController.text);
                        }
                      },
                    )
                  : RaisedButton(
                      textTheme: ButtonTextTheme.accent,
                      child: Text('Login'),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          widget._loginUser(
                              userController.text, passwordController.text);
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
