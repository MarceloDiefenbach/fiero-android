import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fiero/DesignSystem/BaseComponents/Button.dart';
import 'package:fiero/DesignSystem/Tokens.dart';
import 'package:fiero/QuickChallenge/VictoryParameter.dart';

class ChallengeTimeType extends StatefulWidget {

  String type;
  String name;

  ChallengeTimeType(this.type, this.name);

  @override
  State<ChallengeTimeType> createState() => _ChallengeTimeTypeState();
}

class _ChallengeTimeTypeState extends State<ChallengeTimeType> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    returnPrimary() {
      if (widget.type == "highest") {
        return Color(0xff5852DA);
      } else if (widget.type == "quickest") {
        return Color(0xffFF5968);
      }
    }

    returnSecondary() {
      if (widget.type == "highest") {
        return Color(0xffFFB800);
      } else if (widget.type == "quickest") {
        return Color(0xff409C85);
      }
    }

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: colorNeutralBackground(),
        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
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
                          width: width*0.50,
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
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(top: height*0.05)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: returnPrimary(),
                        ),
                        width: width*0.45,
                        height: width*0.55,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.stopwatch_fill,
                              color: colorNeutralHighPure(),
                              size: 50,
                              semanticLabel: 'Icone de criar novo desafio',
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 12)),
                            Text(
                              "Cronômetro",
                              style: TextStyle(
                                  color: colorNeutralHighPure(),
                                  fontWeight: FontWeight.normal,
                                  fontSize: fontSizeXS(),
                                  height: 1.2),
                              textAlign: TextAlign.center,
                              maxLines: null,
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                "Vence quem concluir em menor tempo",
                                style: TextStyle(
                                    color: colorNeutralHighPure(),
                                    fontWeight: FontWeight.normal,
                                    fontSize: fontSizeXXS(),
                                    height: 1),
                                textAlign: TextAlign.center,
                                maxLines: null,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 6)),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: returnSecondary(),
                        ),
                        width: width*0.45,
                        height: width*0.55,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.timer,
                              color: colorNeutralHighPure(),
                              size: 50,
                              semanticLabel: 'Icone de criar novo desafio',
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 12)),
                            Text(
                              "Timer",
                              style: TextStyle(
                                  color: colorNeutralHighPure(),
                                  fontWeight: FontWeight.normal,
                                  fontSize: fontSizeXS(),
                                  height: 1.2),
                              textAlign: TextAlign.center,
                              maxLines: null,
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                "Vence quem fizer a maior quantidade no tempo definido",
                                style: TextStyle(
                                    color: colorNeutralHighPure(),
                                    fontWeight: FontWeight.normal,
                                    fontSize: fontSizeXXS(),
                                    height: 1),
                                textAlign: TextAlign.center,
                                maxLines: null,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Spacer(),
                  // Padding(
                  //   padding: EdgeInsets.only(left: spacingXXXS(), right: spacingXXXS()),
                  //   child: GestureDetector(
                  //       onTap: () {
                  //         Navigator.push(
                  //           context,
                  //           PageRouteBuilder(
                  //             pageBuilder: (context, animation1, animation2) => VictoryParameter(widget.type, ""),
                  //             transitionDuration: Duration.zero,
                  //             reverseTransitionDuration: Duration.zero,
                  //           ),
                  //         );
                  //       },
                  //       child: Button("Próximo", width)
                  //   ),
                  // ),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
