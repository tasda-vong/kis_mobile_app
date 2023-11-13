import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kis_app/NetworkConnectivity.dart';
import 'package:kis_app/data_connection.dart';
import 'package:kis_app/getUserData.dart';
import 'package:kis_app/getstudentdata.dart';

import 'package:kis_app/nav_pages/no_internet.dart';

import 'package:kis_app/read_user_password.dart';

import 'package:kis_app/variables.dart';

import 'package:kis_app/welcome_page.dart';

class CheckConnectivity extends StatefulWidget {
  const CheckConnectivity({super.key});

  @override
  State<CheckConnectivity> createState() => _CheckConnectivityState();
}

class _CheckConnectivityState extends State<CheckConnectivity> {
  @override
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
              return no_internet();
            }
          }
        });
  }
}
