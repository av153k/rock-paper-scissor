import 'dart:math';
import 'dart:js' as js;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:rock_paper_scissor/commons/common_functions.dart';
import 'package:rock_paper_scissor/theme_data/theme_switcher_inherited.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var computerChoices = ["rock", "paper", "scissors"];
  final _random = Random();

  var players = {
    "0": " Computer Wins !",
    "1": "You Win !",
    "2": "It's a draw."
  };

  var colors = {
    -1: Colors.transparent,
    0: Colors.red,
    1: Colors.green,
    2: Colors.blue
  };

  int userScore = 0;
  int computerScore = 0;
  int draws = 0;
  String computerMove = "";
  int res = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Ionicons.ios_sunny),
                Switch(
                  activeColor: Color(0xff393e46),
                  activeTrackColor: Colors.grey,
                  value: ThemeSwitcher.of(context).isDarkModeOn,
                  onChanged: (value) =>
                      ThemeSwitcher.of(context).switchDarkMode(value),
                ),
                Icon(Ionicons.ios_moon),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Rock beats scissors, Scissors beats Paper, Paper beats Rock.",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Card(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                "Total Matches- ${(userScore + computerScore + draws)}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                                softWrap: true,
                                maxFontSize: 25,
                                minFontSize: 18,
                                wrapWords: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      shape: CircleBorder(),
                      color: ThemeSwitcher.of(context).isDarkModeOn
                          ? Color(0xff393e46)
                          : Colors.white,
                      child: InkWell(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            Ionicons.ios_refresh,
                            color: Colors.red,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            userScore = 0;
                            computerScore = 0;
                            draws = 0;
                            computerMove = "";
                            res = -1;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              widthFactor: 2,
              child: Container(
                width: 600,
                child: getCounter(userScore, computerScore, draws),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 600,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: colors[res], width: 2),
                  ),
                  elevation: 2,
                  child: Container(
                    alignment: Alignment.center,
                    width: 300,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      computerMove == "" || res == -1
                          ? "Tap on the Icon to choose"
                          : "Computer drew $computerMove. ${players[res.toString()]}",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              heightFactor: 1,
              child: Container(
                width: 600,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Card(
                        shape: CircleBorder(),
                        elevation: 6,
                        child: InkWell(
                          child: getImageIcons(
                            "assets/images/rock.png",
                            context,
                            _scaffoldKey,
                          ),
                          onTap: () {
                            computerMove = computerChoices[
                                _random.nextInt(computerChoices.length)];
                            res = getWinner("rock", computerMove);
                            stateChange(res);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        shape: CircleBorder(),
                        elevation: 6,
                        child: InkWell(
                          child: getImageIcons(
                            "assets/images/paper.png",
                            context,
                            _scaffoldKey,
                          ),
                          onTap: () {
                            computerMove = computerChoices[
                                _random.nextInt(computerChoices.length)];
                            res = getWinner("paper", computerMove);
                            stateChange(res);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        shape: CircleBorder(),
                        elevation: 6,
                        child: InkWell(
                          child: getImageIcons(
                            "assets/images/scissor.png",
                            context,
                            _scaffoldKey,
                          ),
                          onTap: () {
                            computerMove = computerChoices[
                                _random.nextInt(computerChoices.length)];
                            res = getWinner("scissors", computerMove);
                            stateChange(res);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              child: Container(
                width: 150,
                child: RaisedButton(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: ThemeSwitcher.of(context).isDarkModeOn
                      ? Colors.black
                      : Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Octicons.mark_github),
                      Text(
                        "Repository",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  onPressed: () {
                    js.context.callMethod("open",
                        ["https://github.com/av153k/rock-paper-scissor"]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int getWinner(String userChoice, String computerChoice) {
    if ((userChoice == "rock" && computerChoice == "paper") ||
        (userChoice == "paper" && computerChoice == "scissors") ||
        (userChoice == "scissors" && computerChoice == "rock")) {
      return 0;
    } else if ((userChoice == "rock" && computerChoice == "scissors") ||
        (userChoice == "scissors" && computerChoice == "paper") ||
        (userChoice == "paper" && computerChoice == "rock")) {
      return 1;
    } else {
      return 2;
    }
  }

  Widget getResults(int int1) {
    if (int1 == 0) {
      return Text("Computer Wins. Better luck next time :) ");
    } else if (int1 == 1) {
      return Text("You Win !!! Congratulations :) ");
    } else {
      return Text("Its a draw !! Play again. :) ");
    }
  }

  void stateChange(int res) {
    setState(() {
      if (res == 0) {
        userScore = userScore;
        computerScore = computerScore + 1;
      } else if (res == 1) {
        userScore = userScore + 1;
        computerScore = computerScore;
      } else {
        userScore = userScore;
        computerScore = computerScore;
        draws = draws + 1;
      }
    });
  }
}
