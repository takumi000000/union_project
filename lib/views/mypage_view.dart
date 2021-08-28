import 'package:flutter/material.dart';

var pageName = "Mypage";

class Mypage extends StatelessWidget {
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
        body: Center(child: Icon(Icons.settings)));
  }
}
