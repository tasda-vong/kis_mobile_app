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
import 'package:khmer_date/khmer_date.dart';

class StudentScore extends StatefulWidget {
  const StudentScore({super.key});

  @override
  State<StudentScore> createState() => _StudentScoreState();
}

String stScoreID = '';
String stAcademicYearID = '';
String stProgramLevelDetialID = '';
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
List data_academic_class1 = [];
List data_academic_class2 = [];

List data_student_program = [];
List data_student_classes = [];
List data_student_score = [];
List data_student_score_details = [];

class _StudentScoreState extends State<StudentScore> {
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
        appBar: _MyOwnAppBar('ពិន្ទុ'),
        drawer: MyDrawer(),
        body: _fb_score(),
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
    }
    {}
  }

  Future fetchscoredetails(String scoreid) async {
    String my_url_score_detail;
    my_url_score_detail =
        '$myip/api/scoredetails?id=$studentID&scoreid=$scoreid';
    try {
      var response = await http.get(Uri.parse(my_url_score_detail));
      data_student_score_details = json.decode(response.body);

// ignore: nullable_type_in_catch_clause
    } catch (e) {
      // print('error caught: $e');
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

  Widget ScoreDetail_dialogbox(String scoreid) {
    return Builder(builder: (context) {
      return Container(
        child: _fb_score_detail(scoreid),
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

  get _mystyle {
    return TextStyle(fontWeight: FontWeight.bold, color: Colors.black);
  }

  get _mystyle2 {
    return TextStyle(
        fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 15);
  }

  get _mystyle3 {
    return TextStyle(
        fontWeight: FontWeight.bold, color: Colors.red, fontSize: 15);
  }

  Widget get _listScore {
    return ListView.builder(
        itemCount: data_student_score == null ? 0 : data_student_score.length,
        itemBuilder: (context, index) {
          String _scoremonth = '';
          String _scoreType = '';
          String _rank = '';
          String score_type = '';
          String _scoreid = '';
          String _TotalScore;
          String _AverageScore;
          String _RankScore;
          String _LetterGrade;
          String _Paid;
          _Paid = data_student_score[index]['Paid'];
          if (_Paid == 'P') {
            _TotalScore = data_student_score[index]['TotalScore'];
            _AverageScore = data_student_score[index]['AverageScore'];
            _RankScore = data_student_score[index]['Rank'];
            _LetterGrade = data_student_score[index]['LetterGrade'];
          } else {
            _TotalScore = '';
            _AverageScore = 'មិនទាន់';
            _RankScore = 'បង់ថ្លៃសិក្សា';
            _LetterGrade = '';
          }

          //  String ScoreID = '';
          _rank = data_student_score[index]['Rank'] + '/';
          _scoreid = data_student_score[index]['ScoreID'];
          try {
            if (data_student_score[index]['ScoreType'] == 'MONTHLY') {
              _scoremonth = KhmerDate.date(
                  data_student_score[index]['ScoreMonth'],
                  format: 'mmm');
            } else {
              _scoremonth = '';
            }
          } catch (_) {
            _scoremonth = '-';
          }
          if (data_student_score[index]['ScoreType'] == 'MONTHLY') {
            _scoreType = 'ពិន្ទុប្រចាំខែ ';
            score_type = 'M';
          }

          if (data_student_score[index]['ScoreType'] == 'SEMESTER 1') {
            _scoreType = 'ពិន្ទុប្រចាំឆមាសទី១';
            score_type = 'S1';
          }
          if (data_student_score[index]['ScoreType'] == 'SEMESTER 2') {
            _scoreType = 'ពិន្ទុប្រចាំឆមាសទី២';
            score_type = 'S2';
          }

          if (data_student_score[index]['ScoreType'] == 'ANNUAL') {
            _scoreType = 'ពិន្ទុប្រចាំឆ្នាំ';
            score_type = 'A';
          }
          return Card(
            elevation: 8,
            color: Colors.amber[50],
            // clipBehavior: Clip.antiAliasWithSaveLayer,
            child: ListTile(
              minVerticalPadding: 0,
              contentPadding: EdgeInsets.only(left: 0, right: 0, top: 0),
              title: _scoreContainer1(
                  score_type, _scoreType, _scoremonth, _scoreid, _Paid),

              subtitle: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Center(
                              child: Text(
                        'ពិន្ទុសរុប',
                        style: _mystyle,
                      ))),
                      Expanded(
                          child: Center(
                              child: Text(
                        'មធ្យមភាគ',
                        style: _mystyle,
                      ))),
                      Expanded(
                          child: Center(
                              child: Text(
                        'ចំណាត់ថ្នាក់',
                        style: _mystyle,
                      ))),
                      Expanded(
                          child: Center(
                              child: Text(
                        'និទ្ទេស',
                        style: _mystyle,
                      ))),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Center(
                              child: Text(_TotalScore, style: _mystyle2))),
                      Expanded(
                          child: Center(
                              child: Text(
                        _AverageScore,
                        style: _Paid == 'P' ? _mystyle2 : _mystyle3,
                      ))),
                      Expanded(
                          child: Center(
                              child: Text(
                        _RankScore,
                        style: _Paid == 'P' ? _mystyle2 : _mystyle3,
                      ))),
                      Expanded(
                          child: Center(
                        child: Text(
                          _LetterGrade,
                          style: _mystyle2,
                        ),
                      )),
                    ],
                  ),
                ],
              ),

              //  leading: Text(data_att_detail[index]['Att_Amount']),
            ),
          );
        });
  }

  Widget _scoreContainer1(String scoreType1, String scoreType2,
      String scoreMonth, String scoreID, String Paid) {
    Color title_color;
    Color title_text_color;
    Icon title_icon;
    switch (scoreType1) {
      case 'M':
        title_color = Colors.amber[100]!;
        title_text_color = Colors.lightBlue.shade900;
        title_icon = Icon(Icons.verified);
        break;
      case 'S1':
        title_color = Colors.lightBlue.shade900;
        title_text_color = Colors.white;
        title_icon = Icon(Icons.verified);
        break;

      case 'S2':
        title_color = Colors.orangeAccent;
        title_text_color = Colors.blue[900]!;
        title_icon = Icon(Icons.verified);
        break;
      case 'A':
        title_color = Colors.green[300]!;
        title_text_color = Colors.blue[900]!;
        title_icon = Icon(Icons.verified);
        break;
      default:
        title_color = Colors.amber[100]!;
        title_text_color = Colors.blue[900]!;
        title_icon = Icon(Icons.verified);
    }
    return Container(
        height: 35,
        width: double.infinity,
        color: title_color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_task,
              color: title_text_color,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              scoreType2,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: title_text_color),
            ),
            Text(
              scoreMonth,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: title_text_color),
            ),
            Expanded(
              child: IconButton(
                iconSize: 25,
                alignment: Alignment.centerRight,
                icon: const Icon(Icons.more_horiz_outlined),
                color: Colors.red,
                onPressed: () {
                  if (Paid == '') {
                    return;
                  }

                  showDialog(
                      context: context,
                      builder: (_) => new AlertDialog(
                            insetPadding: EdgeInsets.all(10),
                            contentPadding: EdgeInsets.all(10),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
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
                                      Expanded(
                                          child: ScoreDetail_dialogbox(scoreID))
                                    ],
                                  ),
                                );
                              },
                            ),
                          ));
                  ;
                  // ...
                },
              ),
            ),
          ],
        ));
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

  Widget get _list_score_detail {
    return Column(
      children: [
        Container(
            alignment: Alignment.center,
            child: Text(
              'ពិន្ទុ និងចំណាត់ថ្នាក់តាមមុខវិជ្ជា',
              style: TextStyle(
                  color: Colors.redAccent.shade700,
                  fontFamily: 'KhBat',
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            )),
        Container(
          color: Colors.blueAccent,
          child: Row(children: [
            Container(
              width: 10,
              color: Colors.blueAccent,
            ),
            Expanded(
                child: Text(
              'មុខវិជ្ជា',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'KhBat', fontSize: 13),
            )),
            Container(
                alignment: Alignment.center,
                width: 80,
                child: Text(
                  'ពិន្ទុ',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'KhBat', fontSize: 13),
                )),
            Container(
                alignment: Alignment.center,
                width: 50,
                child: Text(
                  'ចំណាត់​ ថ្នាក់',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'KhBat', fontSize: 13),
                )),
          ]),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: data_student_score_details == null
                  ? 0
                  : data_student_score_details.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 10,
                        ),
                        Expanded(
                            child: Text(
                          data_student_score_details[index]['SubjectName'],
                          style: TextStyle(
                              color: Colors.blue,
                              fontFamily: 'KhBat',
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        )),
                        Container(
                            alignment: Alignment.center,
                            width: 80,
                            child: Text(
                              data_student_score_details[index]['SubjectScore'],
                              style: TextStyle(color: Colors.blue.shade900),
                            )),
                        Container(
                            alignment: Alignment.center,
                            width: 50,
                            child: Text(
                              data_student_score_details[index]['SubjectRank'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orangeAccent.shade700),
                            )),
                      ],

                      //  crossAxisAlignment: CrossAxisAlignment.stretch,
                    ),
                    Container(
                      height: 7,
                      child: Divider(
                        color: Colors.grey,
                      ),
                    )
                  ],
                );
              }),
        )
      ],
    );
  }

  Widget get _selectstudentacademic_backup {
    return ListView.builder(
        itemCount:
            data_academic_class2 == null ? 0 : data_academic_class2.length,
        itemBuilder: (context, index) {
          _getClassByStudentClassID(
              data_academic_class2[index]['Student_Class_ID']);
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

                      String a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11;

                      a1 = data_academic_class2[index]['Promotion'];
                      a2 = data_academic_class2[index]['Academic_Year'];
                      a3 = data_academic_class2[index]['Program_Main'];
                      a4 = data_academic_class2[index]['Program_Sub'];
                      a5 = data_academic_class2[index]['Grade_Main'];
                      a6 = data_academic_class2[index]['Grade_Sub'];
                      a7 = data_academic_class2[index]['program_full_fee'];
                      a8 = data_academic_class2[index]['discount'];
                      a9 = data_academic_class2[index]['program_full_after_dc'];
                      a10 = data_academic_class2[index]['Student_Class_ID'];
                      a11 = data_academic_class2[index]['First_Payment_Date'];
                      // setState(() {
                      getAcademicDATA(
                          a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);

                      //  _fb_academic_class2();
                      stProgramType = '';
                      stProgramLevel = '';
                      stGrade = '';
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
                      data_academic_class2[index]['Promotion'] +
                          ' ឆ្នាំសិក្សា ' +
                          data_academic_class2[index]['Academic_Year'],
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[900]),
                    )),
                    subtitle: Column(
                      children: [
                        Text(
                          data_academic_class2[index]['Program_Main'] +
                              ' : ' +
                              data_academic_class2[index]['Grade_Main'],
                          style:
                              TextStyle(color: Colors.blue[700], fontSize: 15),

                          // style: TextStyle(color: getColor(data[index]['Att_Type'])),
                        ),
                        Text(
                            data_academic_class2[index]['Program_Sub'] +
                                ' : ' +
                                data_academic_class2[index]['Grade_Sub'],
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

  FutureBuilder _fb_score() {
    return FutureBuilder(
        future: fetchscore(),
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

  FutureBuilder _fb_score_detail(String scoreid) {
    return FutureBuilder(
        future: fetchscoredetails(scoreid),
        builder: (context, snapshot) {
          // if connectionState is waiting
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                color: Colors.white,
                child: Center(child: CircularProgressIndicator()));
          } else {
            return Scaffold(
              body: _list_score_detail,
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
          color: Colors.amber.shade200,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
          return GestureDetector(
            onTap: () {
              stPromo = student_classes[index]['Promotion'];
              stAcade = student_classes[index]['Academic'];
              stProgramType = student_classes[index]['ProgramType'];
              stProgramLevel = student_classes[index]['ProgramLevel'];
              stGrade = student_classes[index]['GradeGroup'];
              stClassID = student_classes[index]['ClassID'];
              stAcademicYearID = student_classes[index]['AcademicYearID'];
              stProgramLevelDetialID =
                  student_classes[index]['ProgramLevelDetailID'];
              MyUrl_Score =
                  // '$myip/api/studentscore?id=$studentID&classid=$stClassID';

                  '$myip/api/studentscore?id=$studentID&acadeid=$stAcademicYearID&progdetailid=$stProgramLevelDetialID';

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

Widget _exCard(String stTitle, String stSubTitle) {
  return ExpansionTile(
    title: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "$stTitle",
          ),
          Text(
            "$stSubTitle",
          ),
        ],
      ),
    ),
    children: <Widget>[
      Container(
        margin: EdgeInsets.symmetric(horizontal: 7),
        child: Text(
          "1.......",
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 7),
        child: Text(
          "1.......",
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 7),
        child: Text(
          "2.......",
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 7),
        child: Text(
          "3.......",
        ),
      )
    ],
  );
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
