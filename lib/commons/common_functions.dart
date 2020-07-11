import 'package:flutter/material.dart';
import 'package:rock_paper_scissor/theme_data/theme_switcher_inherited.dart';
import 'package:auto_size_text/auto_size_text.dart';

Widget getImageIcons(String imgPath, BuildContext context,
    GlobalKey<ScaffoldState> _scaffoldKey) {
  return Container(
    padding: EdgeInsets.all(10),
    child: Image.asset(imgPath,
        color: ThemeSwitcher.of(context).isDarkModeOn
            ? Colors.white
            : Colors.black),
  );
}

Widget getCounter(int userScore, int sysScore, int draws) {
  return Row(
    children: [
      showScore(userScore, "You"),
      SizedBox(
        width: 20,
      ),
      showScore(draws, "Draws"),
      SizedBox(
        width: 20,
      ),
      showScore(sysScore, "Computer")
    ],
  );
}

Widget showScore(int int1, String name) {
  return Expanded(
    child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            alignment: Alignment.center,
            height: 40,
            child: Text(
              name,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            height: 80,
            child: AutoSizeText(
              "$int1",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 60),
              
            ),
          ),
        ],
      ),
    ),
  );
}
