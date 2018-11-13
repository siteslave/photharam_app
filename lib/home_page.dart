import 'package:flutter/material.dart';

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
          label: Text('ค้นหา'),
          icon: Icon(Icons.search),
          onPressed: () {},
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
                  onPressed: () {},
                ),
              ],
            ),
            color: Colors.teal,
          ),
        ),
        body: Column(
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/007.jpg'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '24 สิงหาคม 2561 นพ.เกรียงศักดิ์ คำอิ่ม ผู้อำนวยการโรงพยาบาลโพธาราม ร่วมกับความศรัทธาของประชาชน. ครอบครัวชาวหนองโพ มารับบริการและมาร่วมบริจาคเงิน เพื่อร่วมพัฒนาบริการของโรงพยาบาล ขออนุโมทนาบุญ กับครอบครัว. และขอกราบขอพระคุณมา ณ ที่นี้',
                style: TextStyle(fontSize: 20.0),
              ),
            )
          ],
        ));
  }
}
