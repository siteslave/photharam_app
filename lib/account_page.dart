import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:photharam_app/api_provider.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลส่วนตัว'),
      ),
      body: Text('ข้อมูลส่วนตัว'),
    );
  }
}
