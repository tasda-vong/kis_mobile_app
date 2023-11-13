import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:kis_app/variables.dart';

List con = [];
Future fetch_connction() async {
  try {
    String my_url;
    my_url =
        'https://raw.githubusercontent.com/tasda-vong/KIS_School_App/main/mobile_connection_ip';
    var response = await http.get(Uri.parse(my_url));
    con = json.decode(response.body);

    if (con.length > 0) {
      setValue_connction_IP(con[0]['ip_address']);
    }

// ignore: nullable_type_in_catch_clause
  } catch (e) {}
  {}
}

void setValue_connction_IP(String s) {
  myip = s;
}
