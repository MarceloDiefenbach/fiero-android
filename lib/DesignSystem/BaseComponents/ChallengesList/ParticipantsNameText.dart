import 'package:fiero/Classes/QuickChallenge.dart';
import 'package:fiero/DesignSystem/Tokens.dart';
import 'package:flutter/material.dart';

class ParticipantsNameText extends StatefulWidget {

  QuickChallenge quickChallenge;

  ParticipantsNameText(this.quickChallenge);

  @override
  State<ParticipantsNameText> createState() => _ParticipantsNameTextState();
}

class _ParticipantsNameTextState extends State<ParticipantsNameText> {
  @override
  Widget build(BuildContext context) {
    if(widget.quickChallenge.team.length == 1){
      return Text(
        "Apenas você nesse desafio",
        style: TextStyle(
            color: colorNeutralHighPure(),
            fontWeight: FontWeight.normal,
            fontSize: fontSizeXXS(),
            height: 1),
        textAlign: TextAlign.left,
      );
    } else if(widget.quickChallenge.team.length == 2){
      return Row(
        children: [
          Text(
            "Participantes: ${widget.quickChallenge.team[0].name} e ${widget.quickChallenge.team[1].name}",
            style: TextStyle(
                color: colorNeutralHighPure(),
                fontWeight: FontWeight.normal,
                fontSize: fontSizeXXS(),
                height: 1),
            textAlign: TextAlign.left,
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
