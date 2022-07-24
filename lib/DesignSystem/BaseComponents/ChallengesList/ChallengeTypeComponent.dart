import 'dart:async';

import 'package:fiero/Classes/QuickChallenge.dart';
import 'package:fiero/DesignSystem/BaseComponents/ChallengesList/RoundIndicator.dart';
import 'package:fiero/DesignSystem/Tokens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_remaining/time_remaining.dart';
import 'package:intl/intl.dart';


class ChallengeTypeComponent extends StatefulWidget {

  QuickChallenge quickChallenge;

  ChallengeTypeComponent(this.quickChallenge);

  @override
  State<ChallengeTypeComponent> createState() => _ChallengeTypeComponentState();
}

class _ChallengeTypeComponentState extends State<ChallengeTypeComponent> {

  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  String tempo = "";
  late Timer timer;

  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {

    timer = Timer.periodic(Duration(seconds: 1), (timer) {

      DateTime dateTime2 = DateTime(2022, 07, 24, 19, 00, 00);
      Duration duration = dateTime2.difference(DateTime.now());
      setState(() {
        tempo = formatDuration(duration.inSeconds);
      });
    });

    if(widget.quickChallenge.type == "bestof" && widget.quickChallenge.goal == 3.0) {
      return Row(
        children: [
          RoundIndicator("win"),
          Padding(padding: EdgeInsets.only(right: spacingNano())),
          RoundIndicator("loose"),
          Padding(padding: EdgeInsets.only(right: spacingNano())),
          RoundIndicator("default"),
        ],
      );
    } else if(widget.quickChallenge.type == "bestof" && widget.quickChallenge.goal.toDouble() == 5.0) {
      return Row(
        children: [
          RoundIndicator("win"),
          Padding(padding: EdgeInsets.only(right: spacingNano())),
          RoundIndicator("win"),
          Padding(padding: EdgeInsets.only(right: spacingNano())),
          RoundIndicator("loose"),
          Padding(padding: EdgeInsets.only(right: spacingNano())),
          RoundIndicator("default"),
          Padding(padding: EdgeInsets.only(right: spacingNano())),
          RoundIndicator("default"),
        ],
      );
    } else if(widget.quickChallenge.type == "highest") {
      return Container(
        color: Colors.blueAccent,
        height: 10,
      );
    } else if(widget.quickChallenge.type == "quickest") {


      return ShaderMask(
        shaderCallback: (Rect bounds) {
          return RadialGradient(
            center: Alignment.topLeft,
            radius: 1.0,
            colors: <Color>[colorNeutralHighPure(), colorNeutralHighPure()],
            tileMode: TileMode.mirror,
          ).createShader(bounds);
        },
        child: Row(
          children: [
            Icon(
              CupertinoIcons.stopwatch_fill,
              color: colorNeutralHighPure(),
              size: fontSizeXS(),
              semanticLabel: 'Icone de relógio',
            ),
            Padding(padding: EdgeInsets.all(spacingQuarck()/2)),
            Padding(padding: EdgeInsets.all(spacingQuarck()/2)),
            Flexible(
              child: Text(tempo,
                style: TextStyle(
                    color: colorNeutralHighPure(),
                    fontWeight: FontWeight.bold,
                    fontSize: fontSizeXS(),
                    height: 1),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        color: Colors.yellow,
        height: 10,
      );
    }
  }
  String formatDuration(int totalSeconds) {
    final duration = Duration(seconds: totalSeconds);
    final minutes = duration.inMinutes;
    final seconds = totalSeconds % 60;

    final minutesString = '$minutes'.padLeft(2, '0');
    final secondsString = '$seconds'.padLeft(2, '0');

    return '$minutesString min $secondsString seg';
  }
}
