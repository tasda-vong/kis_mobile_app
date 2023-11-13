import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kis_app/login.dart';
import 'package:kis_app/nav_pages/no_internet.dart';
import 'package:kis_app/nav_pages/profile_page.dart';
import 'package:kis_app/read_user_password.dart';
import 'package:kis_app/nav_pages/check_connectivity.dart';
import 'package:kis_app/variables.dart';

import 'package:kis_app/welcome_page.dart';
import 'dart:io';
import 'package:kis_app/data_connection.dart';
import 'package:kis_app/main.dart';
import 'getUserData.dart';
import 'package:kis_app/NetworkConnectivity.dart';

void main() {
  return runApp(MaterialApp(
      debugShowCheckedModeBanner: false, home: MyApp(), routes: {}));
}

String network_Status = '';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.wait([
          getStoredUserPassword(),
          fetch_connction(),
          check_connction(),
          getUserData(studentCode.toUpperCase(), studentPassword),
        ]),
        builder: (context, snapshot) {
          // if connectionState is waiting
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                color: Colors.white,
                child: Center(child: CircularProgressIndicator()));
          } else {
            print(connection_status);
            if (connection_status == 'OK') {
              return WelcomePage();
            } else {
              return CheckConnectivity();
            }
          }
        });
  }
}
