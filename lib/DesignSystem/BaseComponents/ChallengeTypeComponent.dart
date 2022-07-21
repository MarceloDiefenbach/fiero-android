import 'package:fiero/DesignSystem/BaseComponents/RoundIndicator.dart';
import 'package:fiero/DesignSystem/Tokens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChallengeTypeComponent extends StatefulWidget {

  String type;

  ChallengeTypeComponent(this.type);

  @override
  State<ChallengeTypeComponent> createState() => _ChallengeTypeComponentState();
}

class _ChallengeTypeComponentState extends State<ChallengeTypeComponent> {
  @override
  Widget build(BuildContext context) {

    if(widget.type == "MD3") {
      return Row(
        children: [
          RoundIndicator("win"),
          Padding(padding: EdgeInsets.only(right: spacingNano())),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colorHighlight1(),
              borderRadius: BorderRadius.circular(500),
            ),
            child: Icon(
              Icons.check,
              color: colorNeutralHighPure(),
              size: fontSizeSM(),
              semanticLabel: 'Text to announce in accessibility modes',
            ),
          ),
          Padding(padding: EdgeInsets.only(right: spacingNano())),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colorNeutralHighDark(),
              borderRadius: BorderRadius.circular(500),
            ),
            child: Icon(
              Icons.remove,
              color: colorNeutralLowPure(),
              size: fontSizeSM(),
              semanticLabel: 'Text to announce in accessibility modes',
            ),
          )
        ],
      );
    } else if(widget.type == "MD5") {
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
    } else if(widget.type == "Quantity") {
      return Container();
    } else if(widget.type == "Points") {
      return Container();
    } else {
      return Container();
    }
  }
}
