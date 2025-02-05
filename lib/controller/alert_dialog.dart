import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mine_game/core/constants/colors.dart';
import 'package:mine_game/core/utils/short_responsiveness.dart';

Widget myDialog(VoidCallback function) {
  return AlertDialog.adaptive(
    backgroundColor: AppColors.bg,
    alignment: Alignment.center,
    title: Text(
      textAlign: TextAlign.center,
      "Game Over",
      style: TextStyle(color: AppColors.light, fontSize: appW(23)),
    ),
    content: Text(
      textAlign: TextAlign.center,
      "Wanna play again?",
      style: TextStyle(color: AppColors.light, fontSize: appW(15)),
    ),
    actions: [
      Row(
        children: [
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: appW(7)),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                SystemNavigator.pop();
              },
              child: Text(
                "Quit",
                style: TextStyle(color: Colors.red[500], fontSize: appW(17)),
              ),
            ),
          ),
          SizedBox(
            width: appW(25),
          ),
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: function,
              child: Text(
                "Restart",
                style: TextStyle(color: Colors.blue[500], fontSize: appW(17)),
              ),
            ),
          )
        ],
      )
    ],
  );
}
