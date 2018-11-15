import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final String orderId;
  final String formName;

  ResultPage(this.orderId, this.formName);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ผลตรวจสุขภาพ'),
      ),
      body: Column(
        children: <Widget>[Text('ชื่อใบ LAB: ${widget.formName}')],
      ),
    );
  }
}
