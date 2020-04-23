import 'dart:convert';
import 'package:my_first_flutter/models/API.dart';
import 'package:my_first_flutter/models/user.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My third task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyListScreen(),
    );
  }
}

class MyListScreen extends StatefulWidget {
  @override
  createState() => _MyListScreenState();
}

class _MyListScreenState extends State {
  var users = new List<User>();

  _getUsers() {
    API.getUser().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("task 3 Users List"),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(
               leading: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('small-sunflower.png'),
              ),
              title: Text(users[index].name));
          },
        ));
  }
}