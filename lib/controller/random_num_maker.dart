import 'dart:math';

List<int> randomNumberMaker() {
  List<int> list = [];
  Random random = Random();
  while (list.length < 7) {
    int number = random.nextInt(49 - 1);
    if (!list.contains(number)) {
      list.add(number);
    }
  }

  return list;
}
