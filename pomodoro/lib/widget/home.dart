import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final seconds = 10;
  int totalseconds = seconds;
  int pomodoros = 0;
  late Timer timer;
  bool isTicking = false;

  void checkSeconds() {
    if (totalseconds == 0) {
      setState(() {
        totalseconds = seconds + 1;
        pomodoros = pomodoros + 1;
        isTicking = false;
      });
      timer.cancel();
    }
  }

  void countDown(Timer timer) {
    checkSeconds();
    setState(() {
      totalseconds = totalseconds - 1;
    });
  }

  void onClickedTimer() {
    timer = Timer.periodic(Duration(seconds: 1), countDown);
    setState(() {
      isTicking = true;
    });
  }

  void stopTimer() {
    timer.cancel();
    setState(() {
      isTicking = false;
    });
  }

  String stringTimer() {
    var duration = Duration(seconds: totalseconds);
    String time = duration.toString().substring(2, 7);
    return time;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Flexible(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                stringTimer(),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: IconButton(
                color: Theme.of(context).cardColor,
                iconSize: 80,
                onPressed: isTicking ? stopTimer : onClickedTimer,
                icon: isTicking
                    ? Icon(Icons.pause_circle_outline_outlined)
                    : Icon(Icons.play_circle_outline_outlined),
              ),
            ),
          ),
          Flexible(
            child: Container(
              color: Theme.of(context).cardColor,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Pomodoros",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    "$pomodoros",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
