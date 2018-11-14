import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:photharam_app/api_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController ctrlUsername = TextEditingController();
  TextEditingController ctrlPassword = TextEditingController();

  ApiProvider apiProvider = ApiProvider();

  Future doLogin() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      var res = await apiProvider.doLogin(ctrlUsername.text, ctrlPassword.text);
      var jsonDecode = json.decode(res.body);
      if (jsonDecode['ok']) {
        String token = jsonDecode['token'];
        String fullname = jsonDecode['fullname'];
        String hn = jsonDecode['hn'];

        await prefs.setString('token', token);
        await prefs.setString('fullname', fullname);
        await prefs.setString('hn', hn);

        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Fluttertoast.showToast(
            msg: "ชื่อผู้ใช้งาน/รหัสผ่านไม่ถูกต้อง",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            bgcolor: "#e74c3c",
            textcolor: '#ffffff');
      }
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.teal,
          ),
          ListView(
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40.0,
                    ),
                    Image.asset(
                      'assets/images/moph_logo.png',
                      width: 150.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'ผลตรวจสุขภาพประจำปี',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      'โรงพยาบาลโพธาราม',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: ctrlUsername,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 0.0)),
                                  labelText: 'เลขบัตรประชาชน',
                                  prefixIcon: Icon(Icons.credit_card)),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              obscureText: true,
                              controller: ctrlPassword,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 0.0)),
                                  labelText: 'วันเกิด',
                                  prefixIcon: Icon(Icons.calendar_today)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              color: Colors.pink,
                              onPressed: () => doLogin(),
                              child: new Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20.0,
                                  horizontal: 20.0,
                                ),
                                child: Text(
                                  "เข้าใช้งานแอปพลิเคชัน",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
