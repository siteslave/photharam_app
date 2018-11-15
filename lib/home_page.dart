import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:photharam_app/api_provider.dart';
import 'package:photharam_app/result_page.dart';
import 'package:photharam_app/users_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String fullname = '';
  String hn = '';
  String token = '';

  List orders = [];

  ApiProvider apiProvider = ApiProvider();

  Future getLabOrders() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String _token = prefs.getString('token');
      var res = await apiProvider.getLabOrders(_token);
      var jsonDecode = json.decode(res.body);

      print(res.body);

      if (jsonDecode['ok']) {
        setState(() {
          orders = jsonDecode['rows'];
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

  Future getInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      fullname = prefs.getString('fullname');
      hn = prefs.getString('hn');
      token = prefs.getString('token');
    });
  }

  @override
  void initState() {
    super.initState();
    getInfo();
    getLabOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('โพธารามแอปพลิเคชัน'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orange,
        label: Text('ผลตรวจสุขภาพ'),
        icon: Icon(Icons.search),
        onPressed: () {
          Navigator.pushNamed(context, '/result');
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => ResultPage()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        elevation: 3.0,
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UsersPage()));
                },
              ),
            ],
          ),
          color: Colors.teal,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          var item = orders[index];
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                            item['lab_order_number'].toString(),
                            item['form_name'])));
              },
              leading: Icon(Icons.check, color: Colors.green),
              title: Text('${item['order_date']} ${item['order_time']}'),
              subtitle: Text(
                  'ชื่อ LAB: ${item['form_name']}, แผนก: ${item['department']}'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          );
        },
        itemCount: orders.length,
      ),
      // body: Column(
      //   children: <Widget>[
      //     Row(
      //       children: <Widget>[
      //         Expanded(
      //           child: Image(
      //             image: AssetImage('assets/images/007.jpg'),
      //             // width: 200.0,
      //           ),
      //         ),
      //         Expanded(
      //           child: Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: Text(
      //               '24 สิงหาคม 2561 นพ.เกรียงศักดิ์ คำอิ่ม ผู้อำนวยการโรงพยาบาลโพธาราม ร่วมกับความศรัทธาของประชาชน.',
      //               style: TextStyle(fontSize: 20.0),
      //             ),
      //           ),
      //         )
      //       ],
      //     ),
      //   ],
      // ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text('HN: $hn', style: TextStyle(fontSize: 20.0)),
              accountName: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  '$fullname',
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/men/89.jpg'),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home');
              },
              leading: Icon(Icons.home),
              title: Text(
                'หน้าหลัก',
                style: TextStyle(fontSize: 20.0),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/account');
              },
              leading: Icon(Icons.person),
              title: Text(
                'ข้อมูลส่วนตัว',
                style: TextStyle(fontSize: 20.0),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/history');
              },
              leading: Icon(Icons.history),
              title: Text(
                'ประวัติตรวจสุขภาพ',
                style: TextStyle(fontSize: 20.0),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              onTap: () {
                exit(0);
              },
              title: Text(
                'ออกจากแอปพลิเคชัน',
                style: TextStyle(fontSize: 20.0),
              ),
              trailing: Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
