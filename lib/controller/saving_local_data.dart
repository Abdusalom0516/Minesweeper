import 'package:shared_preferences/shared_preferences.dart';

void saveScore(int score) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int lastScore = prefs.getInt("score") ?? 0;
  await prefs.setInt('score', score > lastScore ? score : lastScore);
}
