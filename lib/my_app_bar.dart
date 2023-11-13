import 'package:flutter/material.dart';

AppBar _myAppBar(String title) {
  return AppBar(
    backgroundColor: Colors.blue[900],
    //background color of Appbar to green
    title: Text(
      title,
      style: TextStyle(fontFamily: 'KhBat'),
    ),
    toolbarHeight: 50,
  );
}
