import 'package:fiero/DesignSystem/Tokens.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {

  String title;
  double screenWidth;

  Button(this.title, this.screenWidth);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.screenWidth*0.8,
      decoration: BoxDecoration(
        color: colorNeutralHighPure(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Text(
          widget.title,
          style: TextStyle(
              fontWeight: FontWeight.bold
              ,
              fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
