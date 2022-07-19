import 'package:fiero/DesignSystem/BaseComponents/ChallengeType.dart';
import 'package:fiero/DesignSystem/Tokens.dart';
import 'package:flutter/material.dart';

class ChallengesListCell extends StatefulWidget {

  String title;
  String subtitle;
  String type;

  ChallengesListCell(this.title, this.subtitle, this.type);

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
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "${widget.title}",
                  style: TextStyle(
                      color: colorNeutralHighPure(),
                      fontWeight: FontWeight.bold,
                      fontSize: fontSizeSM()),
                  textAlign: TextAlign.left,
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: colorNeutralHighPure(),
                  size: fontSizeSM(),
                  semanticLabel: 'Icone de abrir o desafio',
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: spacingXXXS())),
            Row(
              children: [
                Text(
                  "Participantes: ${widget.subtitle}",
                  style: TextStyle(
                      color: colorNeutralHighPure(),
                      fontWeight: FontWeight.normal,
                      fontSize: fontSizeXXS()),
                  textAlign: TextAlign.left,
                ),
                Spacer(),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: spacingXXXS())),
            ChallengeType("MD5"),
          ],
        ),
      ),
    );
  }
}
