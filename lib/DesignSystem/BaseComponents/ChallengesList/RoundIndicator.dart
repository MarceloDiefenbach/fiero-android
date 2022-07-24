import 'package:fiero/DesignSystem/Tokens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundIndicator extends StatefulWidget {

  String state;

  RoundIndicator(this.state);

  @override
  State<RoundIndicator> createState() => _RoundIndicatorState();
}

class _RoundIndicatorState extends State<RoundIndicator> {
  @override
  Widget build(BuildContext context) {

    if (widget.state == "win"){
      return Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: colorHighlight6(),
          borderRadius: BorderRadius.circular(500),
        ),
        child: Icon(
          Icons.check,
          color: colorNeutralHighPure(),
          size: fontSizeSM(),
          semanticLabel: 'Text to announce in accessibility modes',
        ),
      );
    } else if (widget.state == "loose"){
      return Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: colorHighlight5(),
          borderRadius: BorderRadius.circular(500),
        ),
        child: Icon(
          Icons.check,
          color: colorNeutralHighPure(),
          size: fontSizeSM(),
          semanticLabel: 'Text to announce in accessibility modes',
        ),
      );
    } else {
      return Container(
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
      );
    }
  }
}
