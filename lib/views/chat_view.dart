import 'package:flutter/material.dart';

var pageName = "Chat";

class Chat extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // Appbar
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            "$pageName",
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: Center(child: Icon(Icons.ballot)));
  }
}
