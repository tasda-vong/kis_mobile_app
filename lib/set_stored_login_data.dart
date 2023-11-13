import 'package:kis_app/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

setstoreuserdata(String propertyname, String value) async {
  final pref = await SharedPreferences.getInstance();

  pref.setString(propertyname, value);
}
