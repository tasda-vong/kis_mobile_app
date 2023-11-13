import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:kis_app/variables.dart';

Future<String> _CheckInternet(String myip) async {
  String rs = '';
  try {
    var result = await InternetAddress.lookup(myip);
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      rs = 'connected';
    }
  } on SocketException catch (_) {
    rs = 'not_connected';
  }
  return rs;
}

Future check_connction() async {
  try {
    var response = await http.get(Uri.parse(myip));
    connection_status = 'OK';
// ignore: nullable_type_in_catch_clause
  } catch (e) {
    connection_status = 'ERROR';
  }
  {}
}
