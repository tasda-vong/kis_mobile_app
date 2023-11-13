import 'dart:convert';
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:kis_app/nav_pages/my_page.dart';
import 'package:kis_app/variables.dart';
import 'package:kis_app/student_data_menu.dart';
import 'package:kis_app/nav_pages/profile_page.dart';
import 'package:kis_app/drawer_menu.dart';

class AllStudents extends StatefulWidget {
  const AllStudents({Key? key}) : super(key: key);

  @override
  State<AllStudents> createState() => _AllStudentsState();
}

List data = [];

class _AllStudentsState extends State<AllStudents> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchallstudentdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('Academic Year'),
              ),
              drawer: MyDrawer(),
              body: ListView.builder(
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: (context, index) {
                    Card(
                      child: Column(children: [
                        ListTile(
                            onTap: () {
                              student_classes =
                                  int.parse(data[index]['Student_Class_ID']);
                              st_academic = data[index]['Academic_Year'];
                              st_grade = data[index]['Grade_Main'];
                              st_ProgramMain = data[index]['Program_Main'];
                              st_ProgramSub = data[index]['Program_Sub'];
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StudentMenuPage()));
                            },
                            title: Text(data[index]['Academic_Year']),
                            subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data[index]['Program_Main'] +
                                        " (" +
                                        data[index]['Grade_Main'] +
                                        ")",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  Text(data[index]['Program_Sub'] +
                                      " (" +
                                      data[index]['Grade_Sub'] +
                                      ")")
                                ]),
                            leading: Column(
                              children: [
                                Text(
                                  data[index]['Promotion'],
                                  style: TextStyle(color: Colors.redAccent),
                                ),
                                Text(
                                  data[index]['Student_Class_ID'],
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            )),
                      ]),
                    );
                  }),
            );
          }
        });
  }

  Future fetchallstudentdata() async {
    try {
      String my_url;
      my_url = '$myip/api/studentacademicclass?id=$studentID';
      var response = await http.get(Uri.parse(my_url));
      data = json.decode(response.body);

      this.setState(() {
        data = json.decode(response.body);
      });
// ignore: nullable_type_in_catch_clause
    } catch (e) {
      print('error caught: $e');
    }
    {}
  }
}
