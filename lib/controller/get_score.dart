import 'package:shared_preferences/shared_preferences.dart';

Future<int> getScore() async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  return pref.getInt("score") ?? 0;
}
