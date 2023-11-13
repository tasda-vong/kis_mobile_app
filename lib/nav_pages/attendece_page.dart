import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:kis_app/drawer_menu.dart';
import 'package:kis_app/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AttendencePage extends StatefulWidget {
  const AttendencePage({Key? key}) : super(key: key);

  @override
  State<AttendencePage> createState() => _AttendencePageState();
}

class _AttendencePageState extends State<AttendencePage> {
  DateTime datetime = DateTime(DateTime.now().year, DateTime.now().month);
  TextEditingController date1 = TextEditingController();
  TextEditingController date2 = TextEditingController();
  TextEditingController stid = TextEditingController();
  List data = [];
  List data_att_detail = [];
  @override
  void initState() {
    super.initState();

    String s1 = "01-" +
        NumberFormat('00').format(DateTime.now().month).toString() +
        "-" +
        DateTime.now().year.toString();

    DateTime d2 = DateTime.now();
    String formattedDate1 = s1;
    String formattedDate2 = DateFormat('dd-MM-yyyy').format(d2);
    date1.text = formattedDate1;
    date2.text = formattedDate2;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'KhBat',
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _MyOwnAppBar('អវត្តមាន'),
        drawer: MyDrawer(),
        body: _buildbody,
      ),
    );
  }

  Future fetchstuddentattendences() async {
    String my_url;

    my_url = '$myip/api/studentatt?id=$studentID&d1=$attdate1&d2=$attdate2';
    var response = await http.get(Uri.parse(my_url));
    data = json.decode(response.body);
    this.setState(() {
      data = json.decode(response.body);
    });
  }

  Future fetchstuddentattendencedetails() async {
    String my_url;
    my_url =
        '$myip/api/studentattdetail?id=$studentID&atttypeid=$att_type_ID&stdate=$att_Date_Serial';
    var response = await http.get(Uri.parse(my_url));
    data_att_detail = json.decode(response.body);
    //this.setState(() {
    // data_att_detail = json.decode(response.body);
    // });
  }

  AppBar _MyOwnAppBar(String sTitle) {
    return AppBar(
      backgroundColor: Colors.blue[900],
      toolbarHeight: 50,
      title: Text(sTitle),
    );
  }

  FutureBuilder _fb() {
    return FutureBuilder(
        future: fetchstuddentattendences(),
        builder: (context, snapshot) {
          if (data.length == 0) {
            Fluttertoast.showToast(
                msg: 'No DATA',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 20);
            return Container(color: Colors.white // This is optional
                );
          } else {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ));
            } else {
              return Scaffold(
                appBar: AppBar(title: Text("Student ...")),
                drawer: MyDrawer(),
                body: _buildlistview,
              );
            }
          }
        });
  }

  FutureBuilder _fb_att_Detial() {
    return FutureBuilder(
        future: fetchstuddentattendencedetails(),
        builder: (context, snapshot) {
          // if connectionState is waiting
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Scaffold(
              body: _attdetail,
            );
          }
          // return widgets and use data
        });
  }

  Widget get _buildbody {
    return Column(
      children: [
        Card(
          elevation: 2,
          margin: EdgeInsets.all(5),
          color: Colors.amber.shade200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 7,
              ),
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 120,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero),
                        ),
                        enabled: false,
                        controller: date1,
                        textAlign: TextAlign.center,

                        // textAlignVertical: TextAlignVertical.top,
                      ),
                    ),
                    Container(
                        color: Colors.blue[900],
                        margin: EdgeInsets.all(0),
                        width: 40,
                        height: 50,
                        alignment: Alignment.center,
                        child: MaterialButton(
                          textColor: Colors.white,
                          onPressed: _show_dt_1,
                          child: Icon(Icons.search, color: Colors.orangeAccent),
                        )),
                    Container(
                      width: 20,
                    ),
                    Container(
                      width: 120,
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero),
                        ),
                        enabled: false,
                        controller: date2,
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                      ),
                    ),
                    Container(
                        width: 40,
                        height: 50,
                        color: Colors.blue[900],
                        margin: EdgeInsets.all(0),
                        child: MaterialButton(
                          textColor: Colors.white,
                          onPressed: _show_dt_2,
                          child: Center(
                              child: Icon(Icons.search,
                                  color: Colors.orangeAccent)),
                        )),
                  ],
                ),
              ),

              // ElevatedButton(
              //   style: const ButtonStyle(
              //     backgroundColor:
              //         MaterialStatePropertyAll<Color>(Colors.green),
              //   ),
              //   child: Text("បង្ហាញពត៌មាន"),
              //   onPressed: () {
              //     // ..
              //     setState(() {
              //       attdate1 = date1.text.replaceAll('-', '');
              //       attdate2 = date2.text.replaceAll('-', '');
              //       _fb();
              //     });
              //   },
              // ),
              SizedBox(
                height: 10,
              ),
              // ElevatedButton(
              //   style: ButtonStyle(
              //     backgroundColor:
              //         MaterialStatePropertyAll<Color>(Colors.green),
              //   ),
              //   child: Text("បង្ហាញពត៌មាន"),
              //   onPressed: () {
              //     // ..
              //     setState(() {
              //       attdate1 = date1.text.replaceAll('-', '');
              //       attdate2 = date2.text.replaceAll('-', '');
              //       _fb();
              //     });
              //   },
              // ),

              SizedBox(
                width: 330,
                child: MaterialButton(
                    minWidth: double.infinity,
                    height: 40,
                    color: Colors.blue[900],
                    textColor: Colors.orangeAccent,
                    onPressed: () {
                      // ..
                      setState(() {
                        attdate1 = date1.text.replaceAll('-', '');
                        attdate2 = date2.text.replaceAll('-', '');
                        _fb();
                      });
                    },
                    child: Text(
                      "បង្ហាញពត៌មាន",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
              Container(
                height: 7,
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.blue,
          height: 20,
        ),
        Expanded(child: _buildlistview),
      ],
    );
  }

  Widget get _attdetail {
    return ListView.builder(
        itemCount: data_att_detail == null ? 0 : data_att_detail.length,
        itemBuilder: (context, index) {
          int x = 0;
          x = index + 1;
          return Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    child: Text(
                      '$x.',
                      style: TextStyle(color: Colors.red),
                    ),
                    width: 20,
                  ),
                  Expanded(child: Text(data_att_detail[index]['Att_Time'])),
                  Text(data_att_detail[index]['Att_Type'],
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: getColor(data_att_detail[index]['Att_Type']))
                      // style: TextStyle(color: getColor(data[index]['Att_Type'])),
                      ),
                ],
              ),
              Divider(),
            ],

            //  leading: Text(data_att_detail[index]['Att_Amount']),
          );
        });
  }

  Widget get _buildlistview {
    return ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (context, index) {
          int x = index + 1;
          String ss = '';
          if (data[index]['Att_Type'] == 'មានច្បាប់' ||
              data[index]['Att_Type'] == 'អត់ច្បាប់') {
            ss = 'ម៉ោង';
          } else {
            ss = 'ដង';
          }
          return Card(
              child: ListTile(
                  contentPadding: EdgeInsets.only(left: 10, right: 10),
                  onTap: () {
                    setState(() {
                      att_Date = data[index]['Att_Date'].toString();
                      att_type_ID = int.parse(data[index]['Att_Type_ID']);

                      att_Date_Serial =
                          data[index]['Att_Serial_Date'].toString();

                      // fetchstuddentattendencedetails();
                    });
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Container(
                              height: 90,
                              color: Colors.blue[900],
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'ព៌តមានលំអិតអំពីវត្តមាន',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text('កាលបរិច្ឆេទៈ$att_Date',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.amber[800]))
                                ],
                              ),
                            ),
                            titlePadding: EdgeInsets.only(top: 0),
                            contentPadding: EdgeInsets.all(10),
                            content: setupAlertDialoadContainer(),
                          );
                        });
                  },
                  title: Row(
                    children: [
                      SizedBox(
                        width: 30,
                        child: Text(
                          '$x .',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      Expanded(child: Text(data[index]['Att_Date'])),
                      Expanded(
                        child: Text(
                          data[index]['Att_Type'],
                          style: TextStyle(
                              color: getColor(data[index]['Att_Type'])),
                        ),
                      ),
                      Expanded(
                          child: Text(
                        data[index]['Att_Total_Sessions'],
                        textAlign: TextAlign.right,
                      )),
                      SizedBox(width: 50, child: Text(' $ss'))
                    ],
                  )));
        });
  }

  Color getColor(String st) {
    if (st == 'មានច្បាប់') {
      return Colors.blue;
    } else {
      return Colors.red;
    }
  }

  void _show_dt_1() {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(2010, 1, 1),
        maxTime: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day),
        theme: DatePickerTheme(
            headerColor: Colors.blue[900],
            backgroundColor: Colors.white,
            itemStyle: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
            doneStyle: TextStyle(color: Colors.white, fontSize: 16)),
        onChanged: (date) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(date);
      date1.text = formattedDate;
    }, onConfirm: (date) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(date);
      date1.text = formattedDate;
    }, currentTime: DateTime.now(), locale: LocaleType.kh);
  }

  void _show_dt_2() {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(2010, 1, 1),
        maxTime: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day),
        theme: DatePickerTheme(
            headerColor: Colors.blue[900],
            backgroundColor: Colors.white,
            itemStyle: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
            doneStyle: TextStyle(color: Colors.white, fontSize: 16)),
        onChanged: (date) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(date);
      date2.text = formattedDate;
    }, onConfirm: (date) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(date);
      date2.text = formattedDate;
    }, currentTime: DateTime.now(), locale: LocaleType.kh);
  }

  void _showdate_diaglog_1() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => SizedBox(
              height: 350,
              child: CupertinoDatePicker(
                backgroundColor: Colors.white,
                initialDateTime: datetime,
                onDateTimeChanged: (DateTime newTime) {
                  setState(() {
                    datetime = newTime;
                    String a1, a2;
                    var a = NumberFormat("00", "en_US");
                    var b = NumberFormat("00", "en_US");
                    a1 = a.format(newTime.day);
                    a2 = b.format(newTime.month);
                    date1.text = '${a1}-${a2}-${newTime.year}';
                  });
                },
                use24hFormat: false,
                dateOrder: DatePickerDateOrder.dmy,
                mode: CupertinoDatePickerMode.date,
              ),
            ));
  }

  void _showdate_diaglog_2() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => SizedBox(
              height: 350,
              child: CupertinoDatePicker(
                backgroundColor: Colors.white,
                initialDateTime: datetime,
                onDateTimeChanged: (DateTime newTime) {
                  setState(() {
                    datetime = newTime;
                    String a1, a2;
                    var a = NumberFormat("00", "en_US");
                    var b = NumberFormat("00", "en_US");
                    a1 = a.format(newTime.day);
                    a2 = b.format(newTime.month);
                    date2.text = '${a1}-${a2}-${newTime.year}';
                  });
                },
                use24hFormat: false,
                dateOrder: DatePickerDateOrder.dmy,
                mode: CupertinoDatePickerMode.date,
              ),
            ));
  }

  setupAlertDialoadContainer() {
    return Builder(builder: (context) {
      return Container(
        height: 500,
        child: _fb_att_Detial(),
      );
    });
  }
}
