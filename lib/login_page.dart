import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.teal,
          ),
          Center(
            child: Column(
              children: <Widget>[
                Divider(
                  height: 80.0,
                ),
                Image.asset(
                  'assets/images/moph_logo.png',
                  width: 200.0,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
