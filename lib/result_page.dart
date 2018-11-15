import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:photharam_app/api_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultPage extends StatefulWidget {
  final String orderId;
  final String formName;
  final String reportDateTime;

  ResultPage(this.orderId, this.formName, [this.reportDateTime]);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List items = [];

  ApiProvider apiProvider = ApiProvider();

  Future getLabResults() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String _token = prefs.getString('token');
      var res = await apiProvider.getLabResults(_token, widget.orderId);
      var jsonDecode = json.decode(res.body);

      print(res.body);

      if (jsonDecode['ok']) {
        setState(() {
          items = jsonDecode['rows'];
        });
      } else {
        Fluttertoast.showToast(
            msg: "เกิดข้อผิดพลาด",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            bgcolor: "#e74c3c",
            textcolor: '#ffffff');
      }
    } catch (error) {
      Fluttertoast.showToast(
          msg: "เกิดข้อผิดพลาด",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          bgcolor: "#e74c3c",
          textcolor: '#ffffff');
    }
  }

  @override
  void initState() {
    super.initState();
    getLabResults();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe9ebee),
      appBar: AppBar(
        title: Text('ผลตรวจสุขภาพ'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'ชื่อใบ LAB: ${widget.formName}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'วันที่รายงาน: ${widget.reportDateTime}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                var item = items[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white),
                    child: ListTile(
                      leading: item['confirm'] == 'Y'
                          ? Icon(Icons.check, color: Colors.green)
                          : Icon(Icons.close, color: Colors.red),
                      title: Text('${item['lab_items_name']}'),
                      trailing: Text('${item['lab_order_result']}'),
                      subtitle: Text(
                          'หน่วย: ${item['lab_items_unit']}, ค่าปกติ: ${item['lab_items_normal_value_ref']}'),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
              itemCount: items.length,
            ),
          )
        ],
      ),
    );
  }
}
