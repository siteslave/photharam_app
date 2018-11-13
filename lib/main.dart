import 'package:flutter/material.dart';
import 'package:photharam_app/account_page.dart';
import 'package:photharam_app/history_page.dart';
import 'package:photharam_app/home_page.dart';
import 'package:photharam_app/result_page.dart';

void main() {
  runApp(PhotharamApp());
}

class PhotharamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.teal, fontFamily: 'KoHo'),
      title: 'โพธาราม แอปพลิเคชัน',
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        '/result': (BuildContext contxt) => ResultPage(),
        '/account': (BuildContext contxt) => AccountPage(),
        '/history': (BuildContext contxt) => HistoryPage(),
        '/home': (BuildContext contxt) => HomePage(),
      },
    );
  }
}
