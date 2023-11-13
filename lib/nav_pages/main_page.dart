import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kis_app/NetworkConnectivity.dart';
import 'package:kis_app/getstudentdata.dart';
import 'package:kis_app/nav_pages/about_page.dart';
import 'package:kis_app/nav_pages/all_students.dart';
import 'package:kis_app/nav_pages/no_internet.dart';
import 'package:kis_app/nav_pages/other_page.dart';
import 'package:kis_app/nav_pages/profile_page.dart';
import 'package:kis_app/nav_pages/attendece_page.dart';
import 'package:kis_app/student_data_menu.dart';
import 'package:kis_app/variables.dart';
import 'package:kis_app/drawer_menu.dart';
import 'package:kis_app/welcome_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getStudentInfoData(studentID),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              child: Center(child: CircularProgressIndicator()),
              color: Colors.white,
            );
          } else {
            if (snapshot.hasError) {
              return no_internet();
            } else {
              return Scaffold(
                body: StudentMenuPage(),
              );
            }
          }
        });
  }
}
