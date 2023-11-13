import 'package:kis_app/getUserData.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'variables.dart';

Future<void> getStoredUserPassword() async {
  final pref = await SharedPreferences.getInstance();
  String x = '';
  studentCode = pref.getString('studentUsername')!;
  studentPassword = pref.getString('studentPassword')!;

  if (studentCode == '' || studentPassword == '') {
    isloged = false;
  } else {
    isloged = true;
  }

  //if (isloged == true) {
  //getUserData(studentCode, studentPassword);
  //}
}
