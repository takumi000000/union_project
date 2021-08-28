import 'package:flutter/material.dart';

var pageName = "Mypage";

class Mypage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[100],
        // Appbar
        appBar: AppBar(
          backgroundColor: Colors.green[100],
          title: Text(
            'mypage',
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: Center(child: Icon(Icons.settings)));
  }
}
