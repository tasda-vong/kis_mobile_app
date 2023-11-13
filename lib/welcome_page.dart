import 'package:flutter/material.dart';
import 'package:kis_app/getUserData.dart';

import 'package:kis_app/login.dart';
import 'package:kis_app/nav_pages/main_page.dart';

import 'variables.dart';
import 'package:kis_app/getstudentdata.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    getUserData(studentCode.toUpperCase(), studentPassword);

    Future.delayed(Duration(seconds: 2), () async {
      if (studentID != '') {
        await getStudentInfoData(studentID);
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
        return;
      }

      if (isloged == false) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } else {
        if (correctLogin == false) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainPage()));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'khBat'),
      home: Scaffold(
        body: _buildbody,
      ),
    );
  }

  void dispose() {}
}

Widget get _buildbody {
  return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Image.asset(
                    'assets/logo_small.png',
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('សាលាកុលបុត្រអន្តរជាតិ',
                  style: TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.normal,
                      color: Colors.white)),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                child: Text('KOLLABOT INTERNATIONAL SCHOOL',
                    style: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                        color: Colors.white)),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ))
            ]),
          ]));
}
