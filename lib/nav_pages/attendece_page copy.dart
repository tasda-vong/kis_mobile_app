import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:kis_app/drawer_menu.dart';
import 'package:kis_app/variables.dart';
import 'package:flutter/cupertino.dart';

class AttendencePage extends StatefulWidget {
  const AttendencePage({Key? key}) : super(key: key);

  @override
  State<AttendencePage> createState() => _AttendencePageState();
}

class _AttendencePageState extends State<AttendencePage> {
  DateTime datetime = DateTime(DateTime.now().year, DateTime.now().month);
  String _datetime = '';
  TextEditingController date1 = TextEditingController();
  TextEditingController date2 = TextEditingController();
  List data = [];
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _fb();
  }

  Future fetchstuddentattendences() async {
    String my_url;
    my_url = '$myip/api/studentatt?id=$studentID';
    var response = await http.get(Uri.parse(my_url));
    data = json.decode(response.body);
    this.setState(() {
      data = json.decode(response.body);
    });
  }

  FutureBuilder _fb() {
    return FutureBuilder(
        future: fetchstuddentattendences(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            return Center(child: CircularProgressIndicator());
          } else {
            return MaterialApp(
              home: Scaffold(
                appBar: AppBar(title: Text("Student Attendence")),
                drawer: MyDrawer(),
                body: RefreshIndicator(
                  key: _refreshIndicatorKey,
                  color: Colors.white,
                  backgroundColor: Colors.blue,
                  strokeWidth: 4.0,
                  onRefresh: () async {
                    // Replace this delay with the code to be executed during refresh
                    // and return a Future when code finishs execution.
                    return Future<void>.delayed(const Duration(seconds: 3));
                  },
                  child: _buildbody,
                ),
              ),
            );
          }
        });
  }

  Widget get _buildbody {
    return Column(
      children: [
        Container(
          height: 200,
          child: Column(
            children: [
              TextField(
                enabled: true,
                controller: date2,
                decoration:
                    InputDecoration(icon: Icon(Icons.calendar_month_rounded)),
              ),
              TextButton(
                  child: Text(
                    "Visit GeeksforGeeks",
                    style: TextStyle(fontSize: 25),
                  ),
                  onPressed: () {
                    setState() {
                      studentID = date1.text;
                    }

                    ;
                    _refreshIndicatorKey.currentState?.show();
                  }),
              CupertinoButton(
                  child: Text('${datetime.month}'),
                  onPressed: () {
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
                                    date1.text =
                                        '${newTime.day}-${newTime.month}-${newTime.year}';
                                  });
                                },
                                use24hFormat: false,
                                dateOrder: DatePickerDateOrder.dmy,
                                mode: CupertinoDatePickerMode.date,
                              ),
                            ));
                  })
            ],
          ),
        ),
        const Divider(
          color: Colors.red,
          height: 20,
        ),
        Expanded(child: _buildlistview),
      ],
    );
  }

  Widget get _buildlistview {
    return ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(data[index]['Att_Date']),
                  subtitle: Text(
                    data[index]['Att_Type'],
                    style: TextStyle(color: getColor(data[index]['Att_Type'])),
                  ),
                  leading: Text(data[index]['Att_Total_Sessions']),
                )
              ],
            ),
          );
        });
  }

  Color getColor(String st) {
    if (st == 'មានច្បាប់') {
      return Colors.blue;
    } else {
      return Colors.red;
    }
  }

  Widget get textfield_date {
    return Column(
      children: [
        Row(
          children: [
            TextField(
              controller: date1,
            ),
            IconButton(onPressed: null, icon: Icon(Icons.calendar_month))
          ],
        ),
        Row(
          children: [
            TextField(
              controller: date2,
            ),
            IconButton(onPressed: null, icon: Icon(Icons.calendar_month))
          ],
        ),
      ],
    );
  }
  // final selected = await showDatePicker(
  //   context: context,
  //   initialDate: _selected ?? DateTime.now(),
  //   firstDate: DateTime(2019),
  //   lastDate: DateTime(2022),
  //   locale: localeObj,
  // );
}
