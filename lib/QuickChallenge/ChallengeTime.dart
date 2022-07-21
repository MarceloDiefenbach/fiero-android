import 'package:fiero/DesignSystem/BaseComponents/Button.dart';
import 'package:fiero/DesignSystem/Tokens.dart';
import 'package:fiero/QuickChallenge/VictoryParameter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChallengeTime extends StatefulWidget {

  String type;
  String name;

  ChallengeTime(this.type, this.name);

  @override
  State<ChallengeTime> createState() => _ChallengeTimeState();
}

class _ChallengeTimeState extends State<ChallengeTime> {
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
      body: Container(
        width: width,
        height: height,
        color: colorNeutralBackground(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Padding(padding: EdgeInsets.only(top: height*0.09)),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: Container(
                        width: width*0.8,
                        height: 10,
                        color: returnPrimary(),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: Container(
                        width: width*0.30,
                        height: 10,
                        color: returnSecondary(),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 30)),
                Text(
                  "Tempo",
                  style: TextStyle(
                      color: colorNeutralHighPure(),
                      fontWeight: FontWeight.bold,
                      fontSize: fontSizeLG(),
                      height: 1),
                  textAlign: TextAlign.center,
                  maxLines: null,
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Text(
                  "O desafio encerrará após\no tempo determinado",
                  style: TextStyle(
                      color: colorNeutralHighPure(),
                      fontWeight: FontWeight.normal,
                      fontSize: fontSizeXS(),
                      height: 1.2),
                  textAlign: TextAlign.center,
                  maxLines: null,
                ),
              ],
            ),
            Column(
              children: [
                Padding(padding: EdgeInsets.only(top: height*0.05)),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height*0.3, left: spacingGlobalMargin(), right: spacingGlobalMargin()),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            color: colorNeutralHighPure(),
                            child: CupertinoTimerPicker(
                              backgroundColor: colorNeutralHighPure(),
                              mode: CupertinoTimerPickerMode.ms,
                              onTimerDurationChanged: (value) {
                                print(value.inSeconds);
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(left: spacingXXXS(), right: spacingXXXS()),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) => VictoryParameter(widget.type, ""),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                        );
                      },
                      child: Button("Próximo", width)
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Voltar",
                    style: TextStyle(
                        color: colorNeutralHighPure(),
                        fontWeight: FontWeight.normal,
                        fontSize: fontSizeXS(),
                        height: 1.2),
                    textAlign: TextAlign.center,
                    maxLines: null,
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 50)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
