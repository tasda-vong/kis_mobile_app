import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'variables.dart';
import 'package:http/http.dart' as http;

Future<String> getStudentPhoto(int studentid) async {
  String my_url;
  my_url = '$myip/api/studentphoto?id=$studentid';
  var response = await http.get(Uri.parse(my_url));
  var jsonrespond = json.decode(response.body);
  try {
    photobyte = json.decode(response.body)['Student_Photo'];
  } catch (exception) {
  } finally {
    return '';
  }
}
