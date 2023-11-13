import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:khmer_date/khmer_date.dart';

import 'package:kis_app/variables.dart';

import 'package:kis_app/drawer_menu.dart';

class StudentSchedule extends StatefulWidget {
  const StudentSchedule({super.key});

  @override
  State<StudentSchedule> createState() => _StudentScheduleState();
}

String stProgramType = '';
String stGrade = '';
String stProgramLevel = '';
String StudentClassID = '';
String stPromotion = '';
String stAcademicYear = '';
String stMainProgram = '';
String stSubProgram = '';
String stMainGrade = '';
String stSubGrade = '';
String stFullFee = '';
String stDiscount = '';
String stFeeAfterDiscount = '';
String stFirstPaymentDate = '';
String stMonthOfMonths = '';
String stPaidOfPayments = '';
String stNextPaymentDate = '';
String stAcade = '';
String stPromo = '';
String stClassID = '';
String MyUrl_Score = '';
String MyUrl_Schedule = '';

List data_academic_class1 = [];
List data_academic_class2 = [];
List data_student_schedule = [];

List data_student_program = [];
List data_student_classes = [];
List data_student_score = [];

class _StudentScheduleState extends State<StudentSchedule> {
  @override
  void dispose() {
    //...
    super.dispose();
    //...
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'KhBat'),
      home: Scaffold(
        appBar: _MyOwnAppBar('កាលវិភាគ'),
        drawer: MyDrawer(),
        body: _fb_schedule(),
      ),
    );
  }

  void initState() {
    super.initState();

    //  fetchdata();
  }

  void getAcademicDATA(
    String s1,
    String s2,
    String s3,
    String s4,
    String a5,
    String a6,
    String a7,
    String a8,
    String a9,
    String a10,
    String a11,
  ) {
    stPromotion = s1;
    stAcademicYear = s2;
    stMainProgram = s3;
    stSubProgram = s4;
    stMainGrade = a5;
    stSubGrade = a6;
    stFullFee = a7;
    stDiscount = a8;
    stFeeAfterDiscount = a9;
    StudentClassID = a10;

    stFirstPaymentDate = KhmerDate.date(a11, format: "dd-mmm-yyyy");
  }

  Future fetchacademicyear(String stID) async {
    try {
      String my_url;

      //  String my_url3;
      my_url = '$myip/api/studentacademicclass?id=$stID';

      //   my_url3 =
      //     '$myip/api/studentpaymentdetail?id=$studentID&studentclassid=$StudentClassID';
      var response = await http.get(Uri.parse(my_url));

      //  var response3 = await http.get(Uri.parse(my_url3));
      data_academic_class2 = json.decode(response.body);

// ignore: nullable_type_in_catch_clause
    } catch (e) {
      print('error caught: $e');
    }
    {}
  }

  Future fetchstudentclasses(String stID) async {
    try {
      String my_url;
      my_url = '$myip/api/studentclasses?id=$stID';
      var response = await http.get(Uri.parse(my_url));
      data_student_classes = json.decode(response.body);

// ignore: nullable_type_in_catch_clause
    } catch (e) {
      print('error caught: $e');
    }
    {}
  }

  Future fetchstudentprogram(String stID, String x) async {
    try {
      String my_url;
      my_url = '$myip/api/studentclasses?id=$stID&studentclassid=$x';
      var response = await http.get(Uri.parse(my_url));
      data_student_classes = json.decode(response.body);

// ignore: nullable_type_in_catch_clause
    } catch (e) {
      print('error caught: $e');
    }
    {}
  }

  Future fetchscore() async {
    String my_url;
    my_url = MyUrl_Score;
    //my_url = '$myip/api/studentscore?id=$studentID&classid=$stClassID';
    try {
      var response = await http.get(Uri.parse(my_url));
      data_student_score = json.decode(response.body);

// ignore: nullable_type_in_catch_clause
    } catch (e) {
      // print('error caught: $e');
      print(my_url);
      print(data_student_score.length.toString());
    }
    {}
  }

  Future fetchschedule() async {
    data_student_schedule.clear();
    String my_url;
    my_url = MyUrl_Schedule;
    //my_url = '$myip/api/studentscore?id=$studentID&classid=$stClassID';
    try {
      var response = await http.get(Uri.parse(my_url));
      data_student_schedule = json.decode(response.body);

// ignore: nullable_type_in_catch_clause
    } catch (e) {
      print('error caught: $e');
    }
    {}
  }

  Widget setupAlertDialoadContainer() {
    return Builder(builder: (context) {
      return Container(
        child: _fb_student_academic(),
      );
    });
  }

  Widget get _selectstudentProgram {
    return ListView.builder(
        itemCount:
            data_student_program == null ? 0 : data_academic_class2.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blueGrey[50],
            // clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              //  crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                    onTap: () {
                      //stAcademicYear ==
                      //  data_academic_class2[index]['Academic_Year'];
                      // stPromotion == data_academic_class2[index]['Promotion'];

                      stProgramType =
                          data_student_program[index]['ProgramType'];
                      stProgramLevel =
                          data_student_program[index]['ProgramLevel'];
                      stGrade = data_student_program[index]['GradeGroup'];
                      //  _fb_academic_class2();

                      Navigator.pop(context);
                      //  });
                      setState(() {});

                      //  Navigator.push(
                      //  context,
                      //MaterialPageRoute(
                      //builder: (context) => Scaffold(
                      //body: _fb_academic_class2(),
                      //),
                      //),
                      //);
                    },
                    title: Center(
                        child: Text(
                      data_student_program[index]['ProgramType'],
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[900]),
                    )),
                    subtitle: Column(
                      children: [
                        Text(
                          data_student_program[index]['ProgramLevel'],
                          style:
                              TextStyle(color: Colors.blue[700], fontSize: 15),

                          // style: TextStyle(color: getColor(data[index]['Att_Type'])),
                        ),
                        Text(data_student_program[index]['GradeGroup'],
                            style: TextStyle(
                                color: Colors.blue[900], fontSize: 14)),
                      ],
                    )

                    //  leading: Text(data_att_detail[index]['Att_Amount']),
                    )
              ],
            ),
          );
        });
  }

  Widget get _listSchedule {
    return ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          int x = index + 1;
          return Card(
            elevation: 8,
            color: Colors.amber[50],
            // clipBehavior: Clip.antiAliasWithSaveLayer,
            child: ListTile(
              minVerticalPadding: 0,
              contentPadding: EdgeInsets.only(left: 0, right: 0, top: 0),
              title: Container(
                  width: double.infinity,
                  color: Colors.amber[100],
                  child: Text('$x')),
              subtitle: Expanded(
                child: _listScheduleDetails,
              ),

              //  leading: Text(data_att_detail[index]['Att_Amount']),
            ),
          );
        });
  }

  Widget get _listScheduleDetails {
    return ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          int x = index + 1;
          return Card(
            elevation: 6,
            color: Colors.yellow[100],
            // clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              //  crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  title: Row(
                    children: [
                      Icon(Icons.date_range_outlined),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        _getDayText(x),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.red[900]),
                      ),
                    ],
                  ),
                  subtitle: _getScheduleDetailByDayID('$x'),
                  contentPadding: EdgeInsets.only(left: 50, right: 50),
                  //  leading: Text(data_att_detail[index]['Att_Amount']),
                )
              ],
            ),
          );
        });
  }

  String _getDayText(int x) {
    String z = '';
    switch (x) {
      case 1:
        {
          z = 'ថ្ងៃចន្ទ';
          // statements;
        }
        break;

      case 2:
        {
          z = 'ថ្ងៃអង្គារ';
        }
        break;
      case 3:
        {
          z = 'ថ្ងៃពុធ';
          // statements;
        }
        break;

      case 4:
        {
          z = 'ថ្ងៃព្រហស្បត្តិ៍';
        }
        break;
      case 5:
        {
          z = 'ថ្ងៃសុក្រ';
          // statements;
        }
        break;

      case 6:
        {
          z = 'ថ្ងៃសៅរ៍';
        }
        break;
    }

    return z;
  }

  Widget get _selectstudentacademic {
    return ListView.builder(
        itemCount:
            data_academic_class2 == null ? 0 : data_academic_class2.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blueGrey[50],
            // clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              //  crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ExpansionTile(
                  title: Row(children: [
                    Text(
                      data_academic_class2[index]['Promotion'],
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[900]),
                    ),
                    Text(
                      ' ឆ្នាំសិក្សា ' +
                          data_academic_class2[index]['Academic_Year'],
                      style: TextStyle(color: Colors.blue[700], fontSize: 15),

                      // style: TextStyle(color: getColor(data[index]['Att_Type'])),
                    ),
                  ]),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _getClassByStudentClassID(
                          data_academic_class2[index]['Student_Class_ID']),
                    )
                  ],

                  //  leading: Text(data_att_detail[index]['Att_Amount']),
                )
              ],
            ),
          );
        });
  }

  FutureBuilder _fb_student_academic() {
    return FutureBuilder(
        future: Future.wait(
            [fetchacademicyear(studentID), fetchstudentclasses(studentID)]),
        builder: (context, snapshot) {
          // if connectionState is waiting
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                color: Colors.white,
                child: Center(child: CircularProgressIndicator()));
          } else {
            return Scaffold(
              body: _selectstudentacademic,
            );
          }
          // return widgets and use data
        });
  }

  FutureBuilder _fb_schedule() {
    return FutureBuilder(
        future: Future.wait([fetchschedule()]),
        builder: (context, snapshot) {
          // if connectionState is waiting
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                color: Colors.white,
                child: Center(child: CircularProgressIndicator()));
          } else {
            return Scaffold(
              body: _buildbody,
            );
          }
          // return widgets and use data
        });
  }

  AppBar _MyOwnAppBar(String sTitle) {
    return AppBar(
        backgroundColor: Colors.blue[900],
        toolbarHeight: 50,
        title: Text(sTitle));
  }

  @override
  Widget get _card1 {
    return Card(
      color: Colors.grey[300],
      margin: EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.zero,
              color: Colors.grey[350],
              child: Text(
                textAlign: TextAlign.center,
                '$stPromo $stAcade',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[900]),
              ),
            ),
          ),
          Text(
            textAlign: TextAlign.center,
            '$stProgramType',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900]),
          ),
          Text(
            textAlign: TextAlign.center,
            '$stGrade',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900]),
          ),
        ],
      ),
    );
  }

  Widget get _buildbody {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Colors.amber.shade200,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(child: _card1),
                      Container(
                        alignment: Alignment.center,
                        child: _btnSelectAcademic,
                        width: 65,
                        height: 95,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
              padding:
                  const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
              child: _listScheduleDetails),
        ),
      ],
    );
  }

  TextStyle _titlestyle() {
    return TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  Widget get _btnSelectAcademic {
    return MaterialButton(
        height: 95,
        color: Colors.blue[900],
        textColor: Colors.white,
        child: Icon(
          Icons.search,
          size: 50,
          weight: 50,
          color: Colors.yellow[800],
        ),
        onPressed: () {
          // ..showGeneralDialog(
          showDialog(
              context: context,
              builder: (_) => new AlertDialog(
                    insetPadding: EdgeInsets.all(10),
                    contentPadding: EdgeInsets.all(10),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    content: Builder(
                      builder: (context) {
                        // Get available height and width of the build area of this widget. Make a choice depending on the size.
                        var height = MediaQuery.of(context).size.height;
                        var width = MediaQuery.of(context).size.width;

                        return Container(
                          height: height - 80,
                          width: width - 80,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(child: setupAlertDialoadContainer())
                            ],
                          ),
                        );
                      },
                    ),
                  ));
          // showGeneralDialog(
          // context: context,
          //barrierDismissible: false,
          //barrierLabel:
          //  MaterialLocalizations.of(context).modalBarrierDismissLabel,
          //barrierColor: Colors.black45,
          //transitionDuration: const Duration(milliseconds: 200),
          //pageBuilder: (BuildContext buildContext, Animation animation,
          //  Animation secondaryAnimation) {
          //return setupAlertDialoadContainer();
          // },
          //);
        });
  }

  Widget get _title {
    return Row(children: [
      Expanded(
          child: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          'កម្មវិធី',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 14, color: Colors.amber),
        ),
      )),
      Expanded(
        child: Text(
          'ភូមិសិក្សា',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 14, color: Colors.amber),
        ),
      ),
      Container(
        width: 55,
        child: Text(
          'កម្រិត',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 14, color: Colors.amber),
        ),
      ),
      Container(
        width: 80,
        child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text(
              'តម្លៃសិក្សា',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.amber,
              ),
            )),
      ),
    ]);
  }

  Widget _getScheduleDetailByDayID(String dayid) {
    List student_schedule = [];
    for (int i = 0; i < data_student_schedule.length; i++) {
      if (data_student_schedule[i]['DayID'].toString() == dayid) {
        student_schedule.add(data_student_schedule[i]);
      }
    }

    return ListView.builder(
        shrinkWrap: true,
        // the number of items in the list
        itemCount: student_schedule == null ? 0 : student_schedule.length,
        // display each item of the product list
        itemBuilder: (context, index) {
          return Card(
            //  margin: EdgeInsets.only(left: 45, right: 45, top: 7, bottom: 7),
            elevation: 5,
            color: Colors.amber[50],
            // In many cases, the key isn't mandatory

            child: ListTile(
              title: Row(
                children: [
                  Icon(Icons.timer, color: Colors.blue[900]),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    student_schedule[index]['TimeText'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue[900]),
                  ),
                ],
              ),
              subtitle: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Icon(Icons.menu_book, color: Colors.green[900]),
                      ),
                      Text(
                        student_schedule[index]['Subject'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green[900]),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Icon(Icons.people, color: Colors.red[900]),
                      ),
                      Text(
                        student_schedule[index]['Teacher'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red[900]),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget _getClassByStudentClassID(String stClassID) {
    List student_classes = [];
    for (int i = 0; i < data_student_classes.length; i++) {
      if (data_student_classes[i]['StudentClassID'].toString() == stClassID) {
        student_classes.add(data_student_classes[i]);
      }
    }

    return ListView.builder(
        shrinkWrap: true,
        // the number of items in the list
        itemCount: student_classes == null ? 0 : student_classes.length,
        // display each item of the product list
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              stPromo = student_classes[index]['Promotion'];
              stAcade = student_classes[index]['Academic'];
              stProgramType = student_classes[index]['ProgramType'];
              stProgramLevel = student_classes[index]['ProgramLevel'];
              stGrade = student_classes[index]['GradeGroup'];
              stClassID = student_classes[index]['ClassID'];
              if (stClassID == '') {
                MyUrl_Schedule = '$myip/api/studentschedule?classid=0';
                MyUrl_Score = '$myip/api/studentscore?id=$studentID&classid=0';
              } else {
                MyUrl_Score =
                    '$myip/api/studentscore?id=$studentID&classid=$stClassID';
                MyUrl_Schedule = '$myip/api/studentschedule?classid=$stClassID';
                print(MyUrl_Schedule);
              }

              setState(() {});
              Navigator.pop(context);
            },
            child: Card(
              elevation: 5,
              color: Colors.amber[50],
              // In many cases, the key isn't mandatory

              child: ListTile(
                title: Text(student_classes[index]['ProgramType']),
                subtitle: Row(
                  children: [
                    Text(student_classes[index]['ProgramLevel']),
                    SizedBox(
                      width: 10,
                    ),
                    Text(student_classes[index]['GradeGroup'])
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget get _subtitle {
    return Row(children: [
      Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              '$stFullFee',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white),
            )),
      ),
      Expanded(
        child: Text(
          '$stFirstPaymentDate',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
        ),
      ),
      Container(
        width: 55,
        child: Text(
          '$stDiscount',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
        ),
      ),
      Container(
        width: 80,
        child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text(
              '$stFeeAfterDiscount',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.white,
              ),
            )),
      ),
    ]);
  }
}

Widget get _title1 {
  return Row(children: [
    Expanded(
        child: Padding(
      padding: EdgeInsets.only(left: 10),
      child: Text(
        'កាលបរិច្ឆែតត្រូវបង់ប្រាក់',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 14, color: Colors.amber),
      ),
    )),
    Container(
      child: Text(
        'ខែ',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 14, color: Colors.amber),
      ),
    ),
    Container(
      width: 180,
      child: Padding(
          padding: EdgeInsets.only(right: 10),
          child: Text(
            'តម្លៃសិក្សា',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.amber,
            ),
          )),
    ),
  ]);
}

Widget get _subtitle1 {
  return Row(children: [
    Expanded(
      child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            '$stNextPaymentDate',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
          )),
    ),
    Container(
      child: Text(
        '$stMonthOfMonths',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
      ),
    ),
    Container(
      width: 180,
      child: Padding(
          padding: EdgeInsets.only(right: 10),
          child: Text(
            '$stPaidOfPayments',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.white,
            ),
          )),
    ),
  ]);
}
