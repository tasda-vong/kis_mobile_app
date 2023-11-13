import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'variables.dart';
import 'package:http/http.dart' as http;

Future<String> getStudentInfoData(String studentid) async {
  String my_url;
  String my_url2;
  my_url = '$myip/api/student?id=$studentid';
  my_url2 = '$myip/api/studentphoto?id=$studentid';

  var response = await http.get(Uri.parse(my_url));
  var jsonrespond = json.decode(response.body);

  var response2 = await http.get(Uri.parse(my_url2));
  var jsonrespond2 = json.decode(response2.body);

  try {
    studentCode = json.decode(response.body)['StudentCode'];
    studentID = json.decode(response.body)['StudentID'];
    gender = json.decode(response.body)['Gender'];
    enName = json.decode(response.body)['StudentNameEN'];
    khName = json.decode(response.body)['StudentNameKH'];
    pob = json.decode(response.body)['StudentPOB'];

    dob = json.decode(response.body)['StudentDOB'];

    currentaddress = json.decode(response.body)['StudentAddress'];
    phoneno = json.decode(response.body)['StudentPhoneNumber'];
    mothername = json.decode(response.body)['StudentMother'];
    fathername = json.decode(response.body)['StudentFather'];

    photobyte = json.decode(response2.body)['Student_Photo'];
  } catch (exception) {
  } finally {
    return '';
  }
}
