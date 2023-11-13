import 'dart:convert';

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:khmer_date/khmer_date.dart';
import 'package:kis_app/getstudentdata.dart';
import 'package:kis_app/login.dart';

import 'package:kis_app/variables.dart';
import 'package:get/get.dart';
import 'package:kis_app/getstudentphoto.dart';
import 'package:kis_app/drawer_menu.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

DateTime _date = DateTime.parse(dob);
String stDOB = '';

class _ProfilePageState extends State<ProfilePage> {
  // The function that fetches data from the API
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // String formattedDate = DateFormat('yyyy-MM-ddThh:mm:ss').format(_date);

    //stDOB = KhmerDate.date(formattedDate, format: "ថ្ងៃទីdd ខែmmm ឆ្នាំyyyy");
    stDOB = dob;
    //  getStudentInfoData(x);
  }

  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner:
    false;
    var x = int.parse(studentID);

    assert(x is int);

    return FutureBuilder<String>(
        future: getStudentInfoData(studentID),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  fontFamily: 'KhBat',
                ),
                home: Scaffold(
                  appBar: _MyOwnAppBar('ព័ត៌មានសិស្ស'),
                  body: _buildbody,
                  drawer: MyDrawer(),
                ));
          } else {
            return Container(
              color: Colors.white,
              child: Center(child: CircularProgressIndicator()),
            );
          }
        });

    ;
  }

  // Generated code for this Column Widget...
}

AppBar _MyOwnAppBar(String sTitle) {
  return AppBar(
    backgroundColor: Colors.blue[900],
    toolbarHeight: 50,
    title: Text(sTitle),
  );
}

Widget get _buildbody {
  return ListView(
    padding: EdgeInsets.zero,
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    children: [
      Card(
          elevation: 5,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                  child: SizedBox(
                height: 300,
                child: Image.memory(base64Decode(photobyte)),
              )),
              Center(
                child: Text(
                  khName,
                  style: TextStyle(fontSize: 35, color: Colors.blueAccent),
                ),
              ),
              Center(
                child: Text(
                  enName,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              Center(
                child: Text(
                  studentCode,
                  style: TextStyle(
                      color: Colors.red.shade900,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )),

      Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Divider(
          height: 10,
          color: Colors.black45,
        ),
      ),
      //  ListTile(
      //  title: Text('ឈ្មោះភាសាខ្មែរ', style: mytitlestyle()),
      // subtitle: Text(
      //    khName,
      //     style: mycontentestyle(),
      //   ),
      //   tileColor: Colors.white,
      //   dense: false,
      // ),
      //  ListTile(
      //  title: Text('ឈ្មោះឡាតាំង', style: mytitlestyle()),
      //   subtitle: Text(
      //     enName,
      //    style: mycontentestyle(),
      //    ),
      //  tileColor: Colors.white,
      //    dense: false,
      //  ),
      Card(
        child: ListTile(
          title: Text('ភេទ', style: mytitlestyle()),
          subtitle: Text(
            gender,
            style: mycontentestyle(),
          ),
          tileColor: Colors.white,
          dense: false,
        ),
      ),
      Card(
        child: ListTile(
          title: Text('ទីកន្លែងកំណើត', style: mytitlestyle()),
          subtitle: Text(
            pob,
            style: mycontentestyle(),
          ),
          tileColor: Colors.white,
          dense: false,
        ),
      ),
      Card(
        child: ListTile(
          title: Text('ថ្ងៃខែឆ្នាំកំណើត', style: mytitlestyle()),
          subtitle: Text(
            stDOB,
            style: mycontentestyle(),
          ),
          tileColor: Colors.white,
          dense: false,
        ),
      ),
      Card(
        child: ListTile(
          title: Text('អាសយដ្ឋានបច្ចុប្បន្ន', style: mytitlestyle()),
          subtitle: Text(
            currentaddress,
            style: mycontentestyle(),
          ),
          tileColor: Colors.white,
          dense: false,
        ),
      ),
      Card(
        child: ListTile(
          title: Text('លេខទំនាក់ទំនង', style: mytitlestyle()),
          subtitle: Text(
            phoneno,
            style: mycontentestyle(),
          ),
          tileColor: Colors.white,
          dense: false,
        ),
      ),
      Card(
        child: ListTile(
          title: Text('អាណាព្យាបាល', style: mytitlestyle()),
          subtitle: Text(
            fathername,
            style: mycontentestyle(),
          ),
          tileColor: Colors.white,
          dense: false,
        ),
      ),
      Card(
        child: ListTile(
          title: Text('អាណាព្យាបាល', style: mytitlestyle()),
          subtitle: Text(
            mothername,
            style: mycontentestyle(),
          ),
          tileColor: Colors.white,
          dense: false,
        ),
      ),
      Divider(
        height: 2,
        color: Colors.black45,
      ),
    ],
  );
}

TextStyle mytitlestyle() {
  return TextStyle(
    color: Colors.blueAccent,
    fontSize: 20,
  );
}

TextStyle mycontentestyle() {
  return TextStyle(
    color: Colors.black,
    fontSize: 20,
  );
}
