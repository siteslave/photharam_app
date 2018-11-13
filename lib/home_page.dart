import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photharam_app/result_page.dart';
import 'package:photharam_app/users_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Image(
                  image: AssetImage('assets/images/007.jpg'),
                  // width: 200.0,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '24 สิงหาคม 2561 นพ.เกรียงศักดิ์ คำอิ่ม ผู้อำนวยการโรงพยาบาลโพธาราม ร่วมกับความศรัทธาของประชาชน.',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail:
                  Text('rianpit@gmail.com', style: TextStyle(fontSize: 20.0)),
              accountName: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  'สถิตย์  เรียนพิศ',
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
