import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kis_app/my_app_bar.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:khmer_date/khmer_date.dart';

import 'package:kis_app/variables.dart';

import 'package:kis_app/drawer_menu.dart';

class StudentAcademic extends StatefulWidget {
  const StudentAcademic({super.key});

  @override
  State<StudentAcademic> createState() => _StudentAcademicState();
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
String stRoom = '';
String stTimeshift = '';
List data_academic_class1 = [];
List data_academic_class2 = [];

List data_student_program = [];
List data_student_classes = [];
List data_student_score = [];

class _StudentAcademicState extends State<StudentAcademic> {
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
        appBar: _MyOwnAppBar('ពត៌មានឆ្នាំសិក្សា'),
        drawer: MyDrawer(),
        body: _fb_student_academic(),
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

  Widget get _listScore {
    return ListView.builder(
        itemCount: data_student_score == null ? 0 : data_student_score.length,
        itemBuilder: (context, index) {
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
                  child: Text(data_student_score[index]['ScoreType'] +
                      ' ' +
                      data_student_score[index]['ScoreMonth'])),
              subtitle: Column(
                children: [
                  Text(data_student_score[index]['TotalScore']),
                  Text(data_student_score[index]['AverageScore']),
                  Text(data_student_score[index]['Rank']),
                  Text(data_student_score[index]['OfStudents']),
                  Text(data_student_score[index]['LetterGrade']),
                ],
              ),

              //  leading: Text(data_att_detail[index]['Att_Amount']),
            ),
          );
        });
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
                    Icon(
                      Icons.library_books,
                      color: Colors.red[900],
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      data_academic_class2[index]['Promotion'],
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[900]),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.cast_for_education,
                      color: Colors.blue[900],
                    ),
                    SizedBox(
                      width: 3,
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

  AppBar _MyOwnAppBar(String sTitle) {
    return AppBar(
      backgroundColor: Colors.blue[900],
      toolbarHeight: 50,
      title: Text(sTitle),
    );
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
            '$stProgramType $stGrade',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900]),
          ),
        ],
      ),
    );
  }

  Widget get _card2 {
    return Card(
        color: Colors.blue[800],
        child: ListTile(
          title: Text(''),
          subtitle: Text(''),
        ));
  }

  Widget get _buildbody {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Colors.blue[50],
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(child: _card1),
                      Container(child: _btnSelectAcademic)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: _listScore),
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
    return IconButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
        ),
        icon: new Icon(
          Icons.settings_display,
          size: 25,
        ),
        color: Colors.green[900],
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
                          height: height - 50,
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
          return Card(
            elevation: 5,
            color: Colors.amber[50],
            // In many cases, the key isn't mandatory

            child: ListTile(
              title: Row(
                children: [
                  Icon(Icons.subject, color: Colors.lightBlue[900]),
                  Text(
                    student_classes[index]['ProgramType'],
                    style: TextStyle(
                        color: Colors.lightBlue[900],
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              subtitle: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 25,
                      ),
                      Icon(Icons.add_chart),
                      Text(student_classes[index]['ProgramLevel']),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.home_mini),
                      Text(student_classes[index]['GradeGroup'])
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 25,
                      ),
                      Icon(Icons.home),
                      Text(student_classes[index]['Room']),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.timer),
                      Text(student_classes[index]['TimeShift'])
                    ],
                  ),
                ],
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
