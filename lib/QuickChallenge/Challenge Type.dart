import 'package:fiero/DesignSystem/BaseComponents/Button.dart';
import 'package:fiero/DesignSystem/Tokens.dart';
import 'package:fiero/QuickChallenge/ChallengeName.dart';
import 'package:fiero/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChallengeType extends StatefulWidget {

  @override
  State<ChallengeType> createState() => _ChallengeTypeState();
}

class _ChallengeTypeState extends State<ChallengeType> {

  late Controller controller;

  @override
  Widget build(BuildContext context) {

    List type = ["quickest", "highest", "bestof"];
    List typeString = ["Tempo", "Quantidade", "Rounds"];
    List description = ["Vence quem fizer mais rápido", "Vence quem fizer algo mais vezes", "Vence quem acumular mais rodadas vitoriosas"];

    controller = Provider.of<Controller>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int _index = 0;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: colorNeutralHighDark(),
            size: fontSizeLG(),
            semanticLabel: 'Icone de criar novo desafio',
          ),
        ),
        // title: Text("",
        //     style: TextStyle(fontWeight: FontWeight.bold, color: colorNeutralHighPure())),
        elevation: 0,
        backgroundColor: colorNeutralBackground(),
        foregroundColor: colorNeutralBackground(),
      ),
      body: Container(
        width: width,
        height: height,
        color: colorNeutralBackground(),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: spacingXXS())),
            Text(
              "Escolha um novo\ndesafio rápido",
              style: TextStyle(
                  color: colorNeutralHighPure(),
                  fontWeight: FontWeight.bold,
                  fontSize: fontSizeLG(),
                  height: 1),
              textAlign: TextAlign.center,
              maxLines: null,
            ),
            Padding(padding: EdgeInsets.only(top: spacingXXS())),
            Center(
              child: SizedBox(
                height: height*0.6, // card height
                child: PageView.builder(
                  itemCount: 3,
                  controller: PageController(viewportFraction: 0.8),
                  itemBuilder: (_, i) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Card(
                        elevation: 1,
                        color: colorNeutralLowDark(),
                        child: SizedBox(
                          width: 300,
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${typeString[i]}",
                                      style: TextStyle(
                                          color: colorNeutralHighPure(),
                                          fontWeight: FontWeight.bold,
                                          fontSize: fontSizeLG(),
                                          height: 1),
                                      textAlign: TextAlign.center,
                                      maxLines: null,
                                    ),
                                    Padding(padding: EdgeInsets.only(top: spacingXXS())),
                                    Text(
                                      "${description[i]}",
                                      style: TextStyle(
                                          color: colorNeutralHighPure(),
                                          fontWeight: FontWeight.normal,
                                          fontSize: fontSizeXS(),
                                          height: 1),
                                      textAlign: TextAlign.center,
                                      maxLines: null,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.all(spacingNano()),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Spacer(),
                                      Padding(
                                        padding: EdgeInsets.only(left: spacingXXXS(), right: spacingXXXS()),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              PageRouteBuilder(
                                                pageBuilder: (context, animation1, animation2) => ChallengeName(type[i]),
                                                transitionDuration: Duration.zero,
                                                reverseTransitionDuration: Duration.zero,
                                              ),
                                            );
                                          },
                                            child: Button("Escolher esse", width)
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
