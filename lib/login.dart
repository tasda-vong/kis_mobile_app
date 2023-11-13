import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kis_app/getuserdata.dart';
//import 'package:kis_app/main.dart';
import 'package:kis_app/nav_pages/home_page.dart';
import 'package:kis_app/nav_pages/main_page.dart';
import 'package:kis_app/nav_pages/profile_page.dart';
import 'package:kis_app/student_data_menu.dart';
import 'package:kis_app/variables.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernamecontrol = TextEditingController();
  TextEditingController passwordcontrol = TextEditingController();

  @override
  void initState() {
    super.initState();
    //   getUserData();
  }

  FutureBuilder _fb_userDATA(String stUserName, String stPassword) {
    return FutureBuilder(
        future: getUserData(stUserName.toUpperCase(), stPassword),
        builder: (context, snapshot) {
          // if connectionState is waiting
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                color: Colors.white,
                child: Center(child: CircularProgressIndicator()));
          } else {
            return StudentMenuPage();
          }

          // return widgets and use data
        });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'KhBat',
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[900],
        body: ListView(
          children: [
            Container(
                margin: const EdgeInsets.all(50.0),
                child: Image.asset(
                  'assets/logo_small.png',
                  width: 150,
                  height: 150,
                )),
            Container(
              margin: EdgeInsets.all(10.0),
              child: TextField(
                controller: usernamecontrol,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  label: Text(
                    'លេខកូដសិស្ស',
                    style: TextStyle(
                      color: Colors.blueGrey,
                    ),
                  ),
                  prefixIcon: Icon(Icons.people),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  label: Text(
                    'លេខសំងាត់',
                    style: TextStyle(
                      color: Colors.blueGrey,
                    ),
                  ),
                  prefixIcon: Icon(Icons.key),
                ),
                obscureText: true,
                controller: passwordcontrol,
              ),
            ),
            Container(
                margin: const EdgeInsets.all(10.0),
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                    onPressed: _loginpress,
                    child: Text(
                      'Log in ',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))),
          ],
        ),
      ),
    );
  }

  Future<void> _loginpress() async {
    bool x = false;
    if (usernamecontrol.text == '') {
      Fluttertoast.showToast(
          msg: 'សូមបញ្ចូលលេខកូដសិស្ស',
          toastLength: Toast.LENGTH_LONG,
          webPosition: 'center',
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          webBgColor: "#ff0000",
          textColor: Colors.white,
          fontSize: 20);
      return;
    }
    if (passwordcontrol.text == '') {
      Fluttertoast.showToast(
          msg: 'សូមបញ្ចូលលេខសំងាត់',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          webPosition: 'center',
          webBgColor: "#ff0000",
          textColor: Colors.white,
          fontSize: 20);
      return;
    }
    bool z = await getUserData(
        usernamecontrol.text.toUpperCase(), passwordcontrol.text);

    if (z == true) {
      storeUserData('studentUsername', usernamecontrol.text);
      storeUserData('studentPassword', passwordcontrol.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    } else {
      Fluttertoast.showToast(
          msg: 'ឈ្មោះ ឬ លេខសំងាត់ មិនត្រឹមត្រូវ',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          webPosition: 'center',
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 20);

      return;
    }

    //  _fb_userDATA(usernamecontrol.text.toUpperCase(), passwordcontrol.text);

    // CircularProgressIndicator();

// Obtain shared preferences.
  }

  // show the dialog
  showAlertDialog(BuildContext context, String sTitle, String sContent) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context, 'OK');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(sTitle),
      content: Text(sContent),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

storeUserData(String _key, String _value) async {
  // Obtain shared preferences.
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(_key, _value);
}
