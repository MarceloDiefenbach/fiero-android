import 'package:fiero/Classes/QuickChallenge.dart';
import 'package:fiero/DesignSystem/BaseComponents/ChallengesList/RoundIndicator.dart';
import 'package:fiero/DesignSystem/Tokens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChallengeTypeComponent extends StatefulWidget {

  QuickChallenge quickChallenge;

  ChallengeTypeComponent(this.quickChallenge);

  @override
  State<ChallengeTypeComponent> createState() => _ChallengeTypeComponentState();
}

class _ChallengeTypeComponentState extends State<ChallengeTypeComponent> {
  @override
  Widget build(BuildContext context) {

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
      // const segundos = widget.quickChallenge.goal;
      // const time = Duration(seconds: segundos);
      return Row(
        children: [
          Icon(
            CupertinoIcons.stopwatch_fill,
            color: colorNeutralHighPure(),
            size: fontSizeXS(),
            semanticLabel: 'Icone de criar novo desafio',
          ),
          Padding(padding: EdgeInsets.all(spacingQuarck()/2)),
          Flexible(
            child: Text(
              " min / ${widget.quickChallenge.goal/60} min",
              style: TextStyle(
                  color: colorNeutralHighPure(),
                  fontWeight: FontWeight.bold,
                  fontSize: fontSizeXS(),
                  height: 1),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      );
    } else {
      return Container(
        color: Colors.yellow,
        height: 10,
      );
    }
  }
}
