import 'package:flutter/material.dart';

import 'package:kis_app/drawer_menu.dart';
import 'package:kis_app/nav_pages/attendece_page.dart';
import 'package:kis_app/nav_pages/profile_page.dart';
import 'package:kis_app/nav_pages/all_students.dart';
import 'package:kis_app/main.dart';
import 'package:kis_app/nav_pages/student_academic.dart';
import 'package:kis_app/nav_pages/student_payment.dart';
import 'package:kis_app/nav_pages/student_score.dart';
import 'package:kis_app/nav_pages/student_schedule.dart';

import 'package:kis_app/nav_pages/about_page.dart';

class StudentMenuPage extends StatefulWidget {
  const StudentMenuPage({super.key});

  @override
  State<StudentMenuPage> createState() => _StudentMenuPageState();
}

class _StudentMenuPageState extends State<StudentMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _MyOwnAppBar('ផ្ទាំងដើម'),
      drawer: MyDrawer(),
      body: _buildbody,
    );
  }

  Widget menuCard(String khTitle, String enTitle, Image img) {
    return Card(
      elevation: 7,
      color: Colors.blue[600],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          img,
          Text(
            khTitle,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontFamily: 'KhBat'),
          ),
          Text(enTitle,
              style: TextStyle(
                  fontFamily: 'Arial', fontSize: 20, color: Colors.yellow[200]))
        ],
      ),
    );
  }

  Widget get _buildbody {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 10),
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StudentScore()));
                },
                child: menuCard("ពិន្ទុ", 'Score',
                    Image.asset('assets/exam.png', width: 50))),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AttendencePage()));
              },
              child: menuCard("អវត្តមាន", 'Attendance',
                  Image.asset('assets/att.png', width: 50)),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StudentSchedule()));
              },
              child: menuCard("កាលវិភាគ", 'Schedule',
                  Image.asset('assets/timetable.png', width: 50)),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => studentpayment()));
              },
              child: menuCard("ការបង់ថ្លៃសិក្សា", 'Payment',
                  Image.asset('assets/payment.png', width: 50)),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
              },
              child: menuCard("ព័ត៌មានសិស្ស", 'Student Info',
                  Image.asset('assets/info.png', width: 50)),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StudentAcademic()));
              },
              child: menuCard("ឆ្នាំសិក្សា", 'Academic Year',
                  Image.asset('assets/acade.png', width: 50)),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutPage()));
              },
              child: menuCard("អំពីសាលា", 'About School',
                  Image.asset('assets/about.png', width: 50)),
            ),
          ],
        ));
  }

  AppBar _MyOwnAppBar(String sTitle) {
    return AppBar(
      backgroundColor: Colors.blue[900],
      toolbarHeight: 50,
      title: Text(sTitle),
    );
  }
}
