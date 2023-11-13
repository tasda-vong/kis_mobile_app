import 'dart:convert';
import 'variables.dart';
import 'package:http/http.dart' as http;

Future<bool> getUserData(String studentusername, String studentpassword) async {
  List data_user = [];
  String my_url;
  bool isfinished = false;
  my_url =
      '$myip/api/studentusers?username=$studentusername&userPassword=$studentpassword';

  // final response = await http.get(
  //   Uri.parse(my_url),
//  );

  var response = await http.get(
    Uri.parse(my_url),
  );
  try {
    data_user = await json.decode(response.body);

    if (data_user.length > 0) {
      studentCode = data_user[0]['StudentCode'];
      studentID = data_user[0]['StudentID'];
      studentPassword = data_user[0]['StudentPassword'];
      correctLogin = true;
      isfinished = true;
      connection_status = 'OK';
    } else {
      studentCode = '';
      studentID = '';
      studentPassword = '';
      correctLogin = false;
      isfinished = false;
    }
  } catch (_) {
    connection_status = 'ERROR';
  } finally {
    return isfinished;
  }

  // try {} catch (exception) {
  // studentCode = '';
  //  studentID = '';
  //  studentPassword = '';
  //  correctLogin = false;
  //  isfinished = false;
  // } finally {
  //   return isfinished;
//  }
}
