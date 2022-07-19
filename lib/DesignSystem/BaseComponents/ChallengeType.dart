import 'package:fiero/DesignSystem/Tokens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChallengeType extends StatefulWidget {

  String type;

  ChallengeType(this.type);

  @override
  State<ChallengeType> createState() => _ChallengeTypeState();
}

class _ChallengeTypeState extends State<ChallengeType> {
  @override
  Widget build(BuildContext context) {

    if(widget.type == "MD3") {
      return Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colorBrandPrimary(),
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
              color: colorBrandSecondary(),
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
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colorBrandPrimary(),
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
              color: colorBrandSecondary(),
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
    } else if(widget.type == "Quantity") {
      return Container();
    } else if(widget.type == "Points") {
      return Container();
    } else {
      return Container();
    }
  }
}
