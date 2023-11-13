import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kis_app/login.dart';
import 'package:kis_app/nav_pages/about_page.dart';
import 'package:kis_app/nav_pages/attendece_page.dart';
import 'package:kis_app/nav_pages/student_payment.dart';
import 'package:kis_app/nav_pages/student_schedule.dart';
import 'package:kis_app/nav_pages/student_score.dart';
import 'package:kis_app/read_user_password.dart';
import 'package:kis_app/variables.dart';
import 'package:kis_app/nav_pages/student_academic.dart';
import 'set_stored_login_data.dart';
import 'student_data_menu.dart';
import 'nav_pages/profile_page.dart';

class MyDrawer extends StatelessWidget {
  @override
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return Drawer(
        width: 250,

        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: _menuList),
            Container(
              height: 20,
              color: Colors.blue[900],
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  'Developed by: Mr.VONG TASDA Tel: 099 977 000',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            )
          ],
        ));
  }

  Widget get _menuList {
    return Builder(builder: (BuildContext context) {
      return ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 120,
            child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      child: Image.memory(base64Decode(photobyte)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            khName,
                            style: TextStyle(
                                fontFamily: 'KhBat',
                                color: Colors.white,
                                fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            enName,
                            style: TextStyle(
                                fontFamily: 'Arial',
                                color: Colors.white,
                                fontSize: 13),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 5),
                          child: Text(
                            studentCode,
                            style: TextStyle(
                                fontFamily: 'Arial',
                                color: Colors.yellow,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
          ListTile(
            title: const Text('ផ្ទាំងដើម',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'KhBat')),
            leading: Image.asset('assets/home.png', width: 25),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StudentMenuPage()));
              if (scaffoldKey.currentState!.isDrawerOpen) {
                scaffoldKey.currentState!.closeDrawer();
                //close drawer, if drawer is open
              } else {
                scaffoldKey.currentState!.openDrawer();
                //open drawer, if drawer is closed
              }
            }

            // Update the state of the app.
            // ...
            ,
          ),
          ListTile(
            title: Text('ពិន្ទុ',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'KhBat')),
            leading: Image.asset('assets/exam.png', width: 25),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StudentScore()));
              if (scaffoldKey.currentState!.isDrawerOpen) {
                scaffoldKey.currentState!.closeDrawer();
                //close drawer, if drawer is open
              } else {
                scaffoldKey.currentState!.openDrawer();
                //open drawer, if drawer is closed
              }
            }
            // Update the state of the app.
            // ...
            ,
          ),
          ListTile(
            title: const Text('​វត្តមាន',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'KhBat')),
            leading: Image.asset('assets/att.png', width: 25),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AttendencePage()));
              if (scaffoldKey.currentState!.isDrawerOpen) {
                scaffoldKey.currentState!.closeDrawer();
                //close drawer, if drawer is open
              } else {
                scaffoldKey.currentState!.openDrawer();
                //open drawer, if drawer is closed
              }
            }
            // Update the state of the app.
            // ...
            ,
          ),
          ListTile(
            title: const Text(
              'កាលវិភាគ',
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontFamily: 'KhBat'),
            ),
            leading: Image.asset('assets/timetable.png', width: 25),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StudentSchedule()));
              if (scaffoldKey.currentState!.isDrawerOpen) {
                scaffoldKey.currentState!.closeDrawer();
                //close drawer, if drawer is open
              } else {
                scaffoldKey.currentState!.openDrawer();
                //open drawer, if drawer is closed
              }
            }
            // Update the state of the app.
            // ...
            ,
          ),
          ListTile(
            title: const Text('ការបង់ថ្លៃសិក្សា',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'KhBat')),
            leading: Image.asset('assets/payment.png', width: 25),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const studentpayment()));
              if (scaffoldKey.currentState!.isDrawerOpen) {
                scaffoldKey.currentState!.closeDrawer();
                //close drawer, if drawer is open
              } else {
                scaffoldKey.currentState!.openDrawer();
                //open drawer, if drawer is closed
              }
            }
            // Update the state of the app.
            // ...
            ,
          ),
          ListTile(
            title: const Text('ព័ត៌មានសិស្ស',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'KhBat')),
            leading: Image.asset('assets/info.png', width: 25),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()));
              if (scaffoldKey.currentState!.isDrawerOpen) {
                scaffoldKey.currentState!.closeDrawer();
                //close drawer, if drawer is open
              } else {
                scaffoldKey.currentState!.openDrawer();
                //open drawer, if drawer is closed
              }
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('ឆ្នាំសិក្សា',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'KhBat')),
            leading: Image.asset('assets/acade.png', width: 25),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StudentAcademic()));
              if (scaffoldKey.currentState!.isDrawerOpen) {
                scaffoldKey.currentState!.closeDrawer();
                //close drawer, if drawer is open
              } else {
                scaffoldKey.currentState!.openDrawer();
                //open drawer, if drawer is closed
              }
            }
            // Update the state of the app.
            // ...
            ,
          ),
          ListTile(
            title: const Text('អំពីសាលា',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'KhBat')),
            leading: Image.asset('assets/about.png', width: 25),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutPage()));
              if (scaffoldKey.currentState!.isDrawerOpen) {
                scaffoldKey.currentState!.closeDrawer();
                //close drawer, if drawer is open
              } else {
                scaffoldKey.currentState!.openDrawer();
                //open drawer, if drawer is closed
              }
            }
            // Update the state of the app.
            // ...
            ,
          ),
          ListTile(
            title: const Text('ចាកចេញ',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'KhBat')),
            leading: Icon(Icons.key),
            onTap: () {
              showAlert(context);
              //setstoreuserdata('studentPassword', '');
              // setstoreuserdata('studentUsername', '');

              //  Future(() => setstoreuserdata('studentUsername', ''));
              //  Future(() => setstoreuserdata('studentPassword', ''));
              //  Future(() => getStoredUserPassword());
              //  Future(() => Logout(context));
              // getStoredUserPassword();

              if (scaffoldKey.currentState!.isDrawerOpen) {
                scaffoldKey.currentState!.closeDrawer();
                //close drawer, if drawer is open
              } else {
                scaffoldKey.currentState!.openDrawer();
                //open drawer, if drawer is closed
              }

              // Update the state of the app.
              // ...
            },
          ),
        ],
      );
    });
  }

  void Logout(BuildContext context) {
    if (isloged == true) {
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }

  void _Setlogout(BuildContext context) {
    String khName = '';
    String enName = '';
    String gender = '';
    String dob = '';
    String pob = '';
    String currentaddress = '';
    String phoneno = '';
    String studentID = '';
    String studentPassword = '';
    String studentCode = '';
    String mothername = '';
    String fathername = '';
    bool correctLogin = false;
    bool isloged = false;
    String photobyte = '';
    int student_classes = 0;
    String st_academic = '';
    String st_promotion = '';
    String st_grade = '';
    String st_ProgramMain = '';
    String st_ProgramSub = '';
    String att_Date = '';
    int att_type_ID = 0;
    String att_Date_Serial = '';
    String attdate1 = '01012000';
    String attdate2 = '01012030';
    String connection_status = '';
    Future(() => setstoreuserdata('studentUsername', ''));
    Future(() => setstoreuserdata('studentPassword', ''));
    Future(() => getStoredUserPassword());
    Future(() => Logout(context));
    getStoredUserPassword();
  }

  AppBar _MyOwnAppBar(String sTitle) {
    return AppBar(
      backgroundColor: Colors.blue[900],
      toolbarHeight: 30,
    );
  }

  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('បញ្ជាក់'),
          content: Text("តើលោកអ្នកប្រាកដពិតជាចង់ចាកចេញ?"),
          actions: <Widget>[
            TextButton(
              child: Text("YES"),
              onPressed: () {
                _Setlogout(context);
                //Put your code here which you want to execute on Yes button click.
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("NO"),
              onPressed: () {
                //Put your code here which you want to execute on No button click.
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
