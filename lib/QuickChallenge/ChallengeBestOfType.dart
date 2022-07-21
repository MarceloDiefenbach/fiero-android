import 'dart:convert';

import 'package:fiero/DesignSystem/Tokens.dart';
import 'package:fiero/QuickChallenge/ChallengeCreated.dart';
import 'package:fiero/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChallengeBestOfType extends StatefulWidget {

  String type;
  String name;

  ChallengeBestOfType(this.type, this.name);

  @override
  State<ChallengeBestOfType> createState() => _ChallengeBestOfTypeState();
}

class _ChallengeBestOfTypeState extends State<ChallengeBestOfType> {

  late Controller controller;

  @override
  Widget build(BuildContext context) {

    controller = Provider.of<Controller>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    createQuickChallenge(String name, double goal) async {

      Map data = {
        "name": name,
        "type": "bestof",
        "goal": goal,
        "goalMeasure": "rounds"
      };

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
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: colorNeutralBackground(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SafeArea(
              child: Column(
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
                    "Melhor de",
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
                    GestureDetector(
                      onTap: () {
                        createQuickChallenge(widget.name, 3.0).then((dados) {
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
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: returnPrimary(),
                        ),
                        width: width*0.45,
                        height: width*0.55,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "3",
                              style: TextStyle(
                                  color: colorNeutralHighPure(),
                                  fontWeight: FontWeight.w900,
                                  fontSize: 70,
                                  height: 1.2),
                              textAlign: TextAlign.center,
                              maxLines: null,
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                "Vence quem fizer 2 pontos primeiro",
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
                    ),
                    Padding(padding: EdgeInsets.only(left: 6)),
                    GestureDetector(
                      onTap: () {
                        createQuickChallenge(widget.name, 5.0).then((dados) {
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
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: returnSecondary(),
                        ),
                        width: width*0.45,
                        height: width*0.55,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "5",
                              style: TextStyle(
                                  color: colorNeutralHighPure(),
                                  fontWeight: FontWeight.w900,
                                  fontSize: 70,
                                  height: 1.2),
                              textAlign: TextAlign.center,
                              maxLines: null,
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                "Vence quem fizer 3 pontos primeiro",
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
                    )
                  ],
                )
              ],
            ),
            SafeArea(
              child: Column(
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
            ),
          ],
        ),
      ),
    );
  }
}
