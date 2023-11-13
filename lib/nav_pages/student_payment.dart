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

class studentpayment extends StatefulWidget {
  const studentpayment({super.key});

  @override
  State<studentpayment> createState() => _studentpaymentState();
}

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
List data_academic_class1 = [];
List data_academic_class2 = [];
List data_student_payment = [];
List data_student_payment_summary = [];
List data_student_payment_detail = [];

class _studentpaymentState extends State<studentpayment> {
  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner:
    false;
    return _fb_academic_class1();
  }

  void initState() {
    super.initState();

    //  fetchdata();
  }

  FutureBuilder _fb_academic_class2() {
    return FutureBuilder(
        future: Future.wait([
          fetchstudentpayment(studentID, StudentClassID),
          fetchstudentpaymentSummary(studentID, StudentClassID)
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Scaffold(
              appBar: _MyOwnAppBar('ការបង់ប្រាក់សិក្សា'),
              drawer: MyDrawer(),
              body: _buildbody,
            );
          }
        });

    // return widgets and use data
  }

  FutureBuilder _fb_academic_class1() {
    return FutureBuilder(
        future: fetchdata1(),
        builder: (context, snapshot) {
          // if connectionState is waiting
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                color: Colors.white,
                child: Center(child: CircularProgressIndicator()));
          } else {
            return FutureBuilder(
                future: Future.wait([
                  fetchstudentpayment(studentID, StudentClassID),
                  fetchstudentpaymentSummary(studentID, StudentClassID)
                ]),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Scaffold(
                      appBar: _MyOwnAppBar('ការបង់ប្រាក់សិក្សា'),
                      drawer: MyDrawer(),
                      body: _buildbody,
                    );
                  }
                });
          }

          // return widgets and use data
        });
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

  Future fetchdata2() async {
    try {
      String my_url;

      //  String my_url3;
      my_url = '$myip/api/studentacademicclass?id=$studentID';

      //   my_url3 =
      //     '$myip/api/studentpaymentdetail?id=$studentID&studentclassid=$StudentClassID';
      var response = await http.get(Uri.parse(my_url));

      //  var response3 = await http.get(Uri.parse(my_url3));
      data_academic_class2 = json.decode(response.body);

      if (data_academic_class2.length > 0) {
        if (data_academic_class2.length > 0) {
          String a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11;

          a1 = data_academic_class2[0]['Promotion'];
          a2 = data_academic_class2[0]['Academic_Year'];
          a3 = data_academic_class2[0]['Program_Main'];
          a4 = data_academic_class2[0]['Program_Sub'];
          a5 = data_academic_class2[0]['Grade_Main'];
          a6 = data_academic_class2[0]['Grade_Sub'];
          a7 = data_academic_class2[0]['program_full_fee'];
          a8 = data_academic_class2[0]['discount'];
          a9 = data_academic_class2[0]['program_full_after_dc'];
          a10 = data_academic_class2[0]['Student_Class_ID'];
          a11 = data_academic_class2[0]['First_Payment_Date'];

          getAcademicDATA(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
        } else {
          getAcademicDATA('', '', '', '', '', '', '', '', '', '', '');
        }
      }

      if (StudentClassID == '' || studentID == '') {
      } else {
        // fetchstudentpayment(studentID, StudentClassID);
        //  fetchstudentpaymentSummary(studentID, studentID);
        // fetchstudentpaymentdetial();
      }

      //  String my_url3;

      //  var response3 = await http.get(Uri.parse(my_url3));

      // data_academic_class2 = json.decode(response1.body);

      //   var response2 = await http.get(Uri.parse(my_url2));

      //  data_student_payment_detail = json.decode(response3.body);
// ignore: nullable_type_in_catch_clause
    } catch (e) {
      print('error caught: $e');
    }
    {}
  }

  Future fetchdata1() async {
    try {
      String my_url;

      //  String my_url3;
      my_url = '$myip/api/studentacademicclass?id=$studentID';

      //   my_url3 =
      //     '$myip/api/studentpaymentdetail?id=$studentID&studentclassid=$StudentClassID';
      var response = await http.get(Uri.parse(my_url));

      //  var response3 = await http.get(Uri.parse(my_url3));
      data_academic_class1 = json.decode(response.body);

      if (data_academic_class1.length > 0) {
        if (data_academic_class1.length > 0) {
          String a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11;

          a1 = data_academic_class1[data_academic_class1.length - 1]
              ['Promotion'];
          a2 = data_academic_class1[data_academic_class1.length - 1]
              ['Academic_Year'];
          a3 = data_academic_class1[data_academic_class1.length - 1]
              ['Program_Main'];
          a4 = data_academic_class1[data_academic_class1.length - 1]
              ['Program_Sub'];
          a5 = data_academic_class1[data_academic_class1.length - 1]
              ['Grade_Main'];
          a6 = data_academic_class1[data_academic_class1.length - 1]
              ['Grade_Sub'];
          a7 = data_academic_class1[data_academic_class1.length - 1]
              ['program_full_fee'];
          a8 =
              data_academic_class1[data_academic_class1.length - 1]['discount'];
          a9 = data_academic_class1[data_academic_class1.length - 1]
              ['program_full_after_dc'];
          a10 = data_academic_class1[data_academic_class1.length - 1]
              ['Student_Class_ID'];
          a11 = data_academic_class1[data_academic_class1.length - 1]
              ['First_Payment_Date'];

          getAcademicDATA(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
        } else {
          getAcademicDATA('', '', '', '', '', '', '', '', '', '', '');
        }
      }

      print('Student ID = $studentID');

      print('Student Class ID = $StudentClassID');
      if (StudentClassID == '' || studentID == '') {
      } else {
        // fetchstudentpayment(studentID, StudentClassID);
        //  fetchstudentpaymentSummary(studentID, studentID);
        // fetchstudentpaymentdetial();
      }

      //  String my_url3;

      //  var response3 = await http.get(Uri.parse(my_url3));

      // data_academic_class2 = json.decode(response1.body);

      //   var response2 = await http.get(Uri.parse(my_url2));

      //  data_student_payment_detail = json.decode(response3.body);
// ignore: nullable_type_in_catch_clause
    } catch (e) {
      print('error caught: $e');
    }
    {}
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

  Future fetchstudentpaymentdetial() async {
    try {
      String my_url;
      my_url =
          '$myip/api/studentpaymentdetail?id=$studentID&studentclassid=$StudentClassID';
      var response = await http.get(Uri.parse(my_url));
      data_student_payment_detail = json.decode(response.body);

// ignore: nullable_type_in_catch_clause
    } catch (e) {
      print('error caught: $e');
    }
    {}
  }

  Future fetchstudentpayment(String stID, String stClassID) async {
    try {
      String my_url;
      my_url = '$myip/api/studentpayment?id=$stID&studentclassid=$stClassID';
      var response = await http.get(Uri.parse(my_url));
      data_student_payment = json.decode(response.body);

// ignore: nullable_type_in_catch_clause
    } catch (e) {
      print('error caught: $e');
    }
    {}
  }

  Future fetchstudentpaymentSummary(String stID, String stClassID) async {
    try {
      String my_url;
      my_url =
          '$myip/api/studentpaymentsummary?id=$studentID&studentclassid=$StudentClassID';
      var response = await http.get(Uri.parse(my_url));
      data_student_payment_summary = json.decode(response.body);

      if (data_student_payment_summary.length > 0) {
        try {
          stNextPaymentDate = KhmerDate.date(
              data_student_payment_summary[0]['Next_Payment_Schedule_Date'],
              format: "dd-mmm-yyyy");
        } catch (e) {
          stNextPaymentDate = '-';
        }

        stMonthOfMonths = data_student_payment_summary[0]['Month_of_Months'];
        stPaidOfPayments = data_student_payment_summary[0]['Paid_of_Payment'];
      }

// ignore: nullable_type_in_catch_clause
    } catch (e) {
      print('error caught: $e');
    }
    {}
  }

  Widget setupAlertDialoadContainer() {
    return Builder(builder: (context) {
      return Container(
        height: 500,
        child: _fb_student_academic(),
      );
    });
  }

  Widget PaymentDetailAlertDialoadContainer() {
    return Builder(builder: (context) {
      return Container(
        height: 400,
        child: _fb_student_payment_detail(),
      );
    });
  }

  Widget get _lststudentpaymentdetail {
    return ListView.builder(
        itemCount: data_student_payment_detail == null
            ? 0
            : data_student_payment_detail.length,
        itemBuilder: (context, index) {
          int x = 0;
          x = index + 1;
          return Card(
            child:

                //contentPadding: EdgeInsets.all(0),

                Container(
              height: 30,
              child: Row(children: [
                SizedBox(
                  width: 50,
                  child: Text(
                    '$x.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.red[900]),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Text(
                    KhmerDate.date(
                        data_student_payment_detail[index]['Payment_Month'],
                        format: "ខែmmm"),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.blue[900]),
                  ),
                ),
                Expanded(
                  child: Text(
                    KhmerDate.date(
                        data_student_payment_detail[index]['Payment_Month'],
                        format: "ឆ្នាំyyyy"),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.blue[900]),
                  ),
                ),
              ]),
            ),

            //  leading: Text(data_att_detail[index]['Att_Amount']),
          );
        });
  }

  Widget get _lststudentpayment {
    return ListView.builder(
        itemCount:
            data_student_payment == null ? 0 : data_student_payment.length,
        itemBuilder: (context, index) {
          int x = 0;
          x = index + 1;
          return Column(children: [
            Container(
                height: 30,
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        '$x',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blue[900]),
                      ),
                      width: 50,
                    ),
                    Expanded(
                      child: Text(
                        KhmerDate.date(
                            data_student_payment[index]['Payment_Date'],
                            format: "dd-mmm-yyyy"),
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      width: 70,
                      child: Text(
                          data_student_payment[index]['Type_of_Payment'],
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.green.shade900, fontSize: 16)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        width: 120,
                        child: Text(
                          data_student_payment[index]['Paid_Amount'],
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red[900]),
                        ),
                      ),
                    ),
                  ],
                )),
            Divider(
              height: 1,
            ),
          ]
              //  leading: Text(data_att_detail[index]['Att_Amount']),

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

                      _fb_academic_class2();

                      Navigator.pop(context);
                      //  });

                      //  .toString());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Scaffold(
                            body: _fb_academic_class2(),
                          ),
                        ),
                      );
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

  FutureBuilder _fb_student_payment_detail() {
    return FutureBuilder(
        future: fetchstudentpaymentdetial(),
        builder: (context, snapshot) {
          // if connectionState is waiting
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                color: Colors.white,
                child: Center(child: CircularProgressIndicator()));
          } else {
            return Scaffold(
              body: _lststudentpaymentdetail,
            );
          }
          // return widgets and use data
        });
  }

  FutureBuilder _fb_student_academic() {
    return FutureBuilder(
        future: fetchacademicyear(studentID),
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

  Widget get _buildbody {
    return Column(
      children: [
        Container(
          color: Colors.blue[50],
          child: Column(
            children: [
              Container(
                child: Card(
                    color: Colors.blue[800],
                    margin: EdgeInsets.all(3),
                    child: ListTile(
                        minVerticalPadding: 2,
                        title: Center(
                          child: Text(
                            '$stPromotion $stAcademicYear',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber),
                          ),
                        ),
                        subtitle: Column(
                          children: [
                            Text(
                              '$stMainProgram  ($stMainGrade)',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text('$stSubProgram ($stSubGrade)',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))
                          ],
                        ))),
              ),
              Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.all(3),
                  child: Card(
                      margin: EdgeInsets.zero,
                      clipBehavior: Clip.antiAlias,
                      color: Colors.blue[800],
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          _title,
                          _subtitle,
                          SizedBox(
                            height: 5,
                          )
                        ],
                      ))),
              Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.all(3),
                  child: Card(
                      margin: EdgeInsets.zero,
                      clipBehavior: Clip.antiAlias,
                      color: Colors.blue[800],
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          _title1,
                          _subtitle1,
                          SizedBox(
                            height: 5,
                          )
                        ],
                      ))),
              Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(child: _btnSelectAcademic),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: _btnShowPaymentMonth),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: _payment_title,
              ),
            ],
          ),
        ),
        Expanded(child: _lststudentpayment)
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

  Widget get _payment_title {
    return Container(
      height: 35,
      color: Colors.black54,
      child: Row(children: [
        SizedBox(
          width: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'ល.រ',
              style: _titlestyle(),
            ),
          ),
        ),
        Expanded(
          child: Text(
            'កាលបរិច្ចេទ',
            style: _titlestyle(),
          ),
        ),
        SizedBox(
          width: 70,
          child: Text(
            'ប្រភេទ',
            style: _titlestyle(),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(
          width: 120,
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              'ទឹកប្រាក់',
              style: _titlestyle(),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ]),
    );
  }

  Widget get _btnSelectAcademic {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
      ),
      child: Text("ជ្រើសរើសឆ្នាំសិក្សា"),
      onPressed: () {
        // ..
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
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              color: Colors.blue[900],
                              child: Text(
                                'ជ្រើសរើសឆ្នាំសិក្សា',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Expanded(child: setupAlertDialoadContainer())
                          ],
                        ),
                      );
                    },
                  ),
                ));
      },
    );
  }

  Widget get _btnShowPaymentMonth {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
      ),
      child: Text("តារាងខែដែលបានបង់ប្រាក់"),
      onPressed: () {
        // ..

        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.lightBlue[900],
                insetPadding: EdgeInsets.zero,
                contentPadding: EdgeInsets.zero,
                // clipBehavior: Clip.antiAliasWithSaveLayer,
                title: Container(
                  height: 80,
                  child: Column(
                    children: [
                      Text(
                        'តារាងខែដែលបានបង់ថ្លៃសិក្សា',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                content: PaymentDetailAlertDialoadContainer(),
              );
            });
      },
    );
  }

  Widget get _title {
    return Row(children: [
      Expanded(
          child: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          'តម្លៃសិក្សាពេញ',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 14, color: Colors.amber),
        ),
      )),
      Expanded(
        child: Text(
          'បង់ប្រាក់លើកទី១',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 14, color: Colors.amber),
        ),
      ),
      Container(
        width: 55,
        child: Text(
          'បញ្ចុះ%',
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
