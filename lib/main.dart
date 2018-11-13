import 'package:flutter/material.dart';
import 'package:photharam_app/home_page.dart';

void main() {
  runApp(PhotharamApp());
}

class PhotharamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.teal, fontFamily: 'KoHo'),
        title: 'โพธาราม แอปพลิเคชัน',
        home: HomePage());
  }
}
