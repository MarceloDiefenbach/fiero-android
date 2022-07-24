import 'package:fiero/DesignSystem/BaseComponents/Button.dart';
import 'package:fiero/DesignSystem/Tokens.dart';
import 'package:fiero/ChallengesList.dart';
import 'package:flutter/material.dart';

class ChallengeCreated extends StatefulWidget {

  String type;

  ChallengeCreated(this.type);

  @override
  State<ChallengeCreated> createState() => _ChallengeCreatedState();
}

class _ChallengeCreatedState extends State<ChallengeCreated> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    returnPrimary() {
      if (widget.type == "highest") {
        return Color(0xff5852DA);
      } else if (widget.type == "quickest") {
        return Color(0xffFF5968);
      } else if (widget.type == "bestof") {
        return Color(0xff2C28E3);
      }
    }

    returnSecondary() {
      if (widget.type == "highest") {
        return Color(0xffFFB800);
      } else if (widget.type == "quickest") {
        return Color(0xff409C85);
      } else if (widget.type == "bestof") {
        return Color(0xff47C18E);
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: returnPrimary(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset('assets/QuickChallengeCreate/eyes.png',
                  fit: BoxFit.fitWidth,
                  width: height*0.35,
                  height: height*0.23,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: height*0.07)),
              Text(
                "Desafio criado com sucesso",
                style: TextStyle(
                    color: colorNeutralHighPure(),
                    fontWeight: FontWeight.bold,
                    fontSize: fontSizeMD()),
                textAlign: TextAlign.center,
              ),
              Padding(padding: EdgeInsets.only(top: height*0.2)),
            ],
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spacingXXXS()),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) => Home(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      );
                    },
                      child: Button("Voltar para a lista", width)
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: height*0.02)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
