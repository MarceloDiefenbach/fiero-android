import 'dart:convert';

import 'package:fiero/DesignSystem/BaseComponents/Button.dart';
import 'package:fiero/DesignSystem/Tokens.dart';
import 'package:fiero/QuickChallenge/ChallengeCreated.dart';
import 'package:fiero/QuickChallenge/VictoryParameter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fiero/controller.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ChallengeTime extends StatefulWidget {

  String type;
  String name;
  String timeType;

  ChallengeTime(this.type, this.name, this.timeType);

  @override
  State<ChallengeTime> createState() => _ChallengeTimeState();
}

class _ChallengeTimeState extends State<ChallengeTime> {

  late Controller controller;

  @override
  Widget build(BuildContext context) {

    controller = Provider.of<Controller>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double timeAsSeconds = 0.0;
    String subtitle= "";

    createQuickChallenge(String name, double goal) async {

      Map data;

      if (widget.timeType == "timer") {
        data = {
          "name": name,
          "type": "highest",
          "goal": goal,
          "goalMeasure": "seconds"
        };
      } else {
        data = {
          "name": name,
          "type": "quickest",
          "goal": goal,
          "goalMeasure": "unity"
        };
      }

      var jsonData = jsonEncode(data);

      http.Response response;

      response = await http.post(
        Uri.parse('http://${getIP()}:3333/quickChallenge/create'),
        headers: {
          'Content-Type': 'application/json',
          'authToken': '${controller.token}'
        },
        body: jsonData,
      );

      Map<dynamic, dynamic> retorno = jsonDecode(response.body);
      if(response.statusCode.toString() == "200" ) {

        return response;
      }
      return response.statusCode;
    }

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

    if (widget.timeType == "timer") {
      subtitle = "O desafio encerrará após\n o tempo determinado";
    } else {
      subtitle = "O desafio encerrará quando a\nprimeira pessoa cumprir o obejtivo";
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
                    subtitle,
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
                                  timeAsSeconds = value.inSeconds.toDouble();
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
                          createQuickChallenge(widget.name, timeAsSeconds).then((dados) {
                            print(dados);
                            if (dados == 201){
                              Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation1, animation2) => ChallengeCreated(widget.type),
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero,
                                ),
                              );
                            }
                          });
                        },
                        child: Button("Criar desafio", width)
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
