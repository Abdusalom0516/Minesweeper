import 'package:flutter/material.dart';
import 'package:mine_game/controller/alert_dialog.dart';
import 'package:mine_game/controller/get_score.dart';
import 'package:mine_game/controller/random_num_maker.dart';
import 'package:mine_game/controller/saving_local_data.dart';
import 'package:mine_game/core/constants/colors.dart';
import 'package:mine_game/core/utils/short_responsiveness.dart';
import 'package:mine_game/presentation/home/widgets/surface_maker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> list = randomNumberMaker();
  List<bool> pressedStates = List.filled(49, false);
  int currentScore = 0;
  int record = 0;

  void getRecord() async {
    int score = await getScore();
    print("Current Record");
    setState(() {
      record = score;
    });
  }

  void resetGame() {
    saveScore(currentScore);
    setState(() {
      list = randomNumberMaker();
      pressedStates = List.filled(49, false);
      currentScore = 0;
    });
    getRecord();
  }

  void resetGameInDialog() {
    saveScore(currentScore);
    setState(() {
      list = randomNumberMaker();
      pressedStates = List.filled(49, false);
      currentScore = 0;
    });
    getRecord();
    Navigator.pop(context);
  }

  @override
  void initState() {
    getRecord();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        toolbarHeight: appH(91),
        backgroundColor: AppColors.bg,
        centerTitle: true,
        foregroundColor: AppColors.light,
        title: Text(
          "Minesweeper",
          style: TextStyle(fontSize: appW(39), fontWeight: FontWeight.w600),
        ),
      ),
      bottomNavigationBar: TextButton(
        onPressed: resetGame,
        child: Container(
          margin:
              EdgeInsets.symmetric(vertical: appH(25), horizontal: appW(35)),
          padding:
              EdgeInsets.symmetric(horizontal: appW(25), vertical: appW(13)),
          decoration: BoxDecoration(
              color: AppColors.light,
              borderRadius: BorderRadius.circular(appW(1000))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Start Over",
                style: TextStyle(color: AppColors.bg, fontSize: appW(19)),
              ),
              Icon(
                Icons.restart_alt_rounded,
                color: AppColors.bg,
                size: appW(35),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: appW(20)),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Current Score: $currentScore",
                style: TextStyle(color: AppColors.light, fontSize: appW(25)),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(top: appH(17)),
                child: Text(
                  "Your Record: $record",
                  style: TextStyle(color: AppColors.light, fontSize: appW(25)),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 49,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  childAspectRatio: 1 / 1,
                  crossAxisSpacing: appW(7),
                  mainAxisSpacing: appH(7),
                ),
                itemBuilder: (context, index) => SurfaceMaker(
                  id: index,
                  list: list,
                  isPressed: pressedStates[index],
                  onPressed: () {
                    setState(() {
                      pressedStates[index] = true;
                      !list.contains(index)
                          ? currentScore += 1
                          : showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) => myDialog(resetGameInDialog),
                            );
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
