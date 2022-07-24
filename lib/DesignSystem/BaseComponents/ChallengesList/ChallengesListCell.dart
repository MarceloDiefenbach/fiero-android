import 'package:fiero/Classes/QuickChallenge.dart';
import 'package:fiero/DesignSystem/BaseComponents/ChallengesList/ChallengeTypeComponent.dart';
import 'package:fiero/DesignSystem/BaseComponents/ChallengesList/ParticipantsNameText.dart';
import 'package:fiero/DesignSystem/Tokens.dart';
import 'package:flutter/material.dart';

class ChallengesListCell extends StatefulWidget {

  QuickChallenge quickChallenge;

  ChallengesListCell(this.quickChallenge);

  @override
  State<ChallengesListCell> createState() => _ChallengesListCellState();
}

class _ChallengesListCellState extends State<ChallengesListCell> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: width*0.8,
      decoration: BoxDecoration(
        color: colorNeutralLowDark(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(spacingXXXS()),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.arrow_forward_ios,
                  color: colorNeutralHighPure(),
                  size: fontSizeSM(),
                  semanticLabel: 'Icone de abrir o desafio',
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        "${widget.quickChallenge.name}",
                        style: TextStyle(
                            color: colorNeutralHighPure(),
                            fontWeight: FontWeight.bold,
                            fontSize: fontSizeSM(),
                            height: 1),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: spacingXXXS())),
                Row(
                  children: [
                    Flexible(
                      child: ParticipantsNameText(widget.quickChallenge),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: spacingXXXS())),
                ChallengeTypeComponent(widget.quickChallenge),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
