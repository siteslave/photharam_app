import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:photharam_app/api_provider.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  ApiProvider apiProvider = ApiProvider();

  List users = [];

  Future getUsers() async {
    var res = await apiProvider.getUsers();
    var jsonRes = json.decode(res.body);

    setState(() {
      users = jsonRes['results'];
    });

    print(users);
  }

  @override
  void initState() {
    super.initState();

    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายชื่อผู้มารับบริการ'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          var item = users[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(item['picture']['large']),
            ),
            title: Text(
                '${item['name']['title']}.${item['name']['first']} ${item['name']['last']}'),
            subtitle: Text('${item['email']}'),
            trailing: Icon(Icons.arrow_forward_ios),
          );
        },
        itemCount: users.length,
      ),
    );
  }
}
