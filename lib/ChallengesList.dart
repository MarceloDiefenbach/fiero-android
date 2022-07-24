import 'dart:convert';

import 'package:fiero/Classes/Members.dart';
import 'package:fiero/Classes/Owner.dart';
import 'package:fiero/Classes/OwnerTeam.dart';
import 'package:fiero/Classes/QuickChallenge.dart';
import 'package:fiero/Classes/Team.dart';
import 'package:fiero/Classes/Teams.dart';
import 'package:fiero/DesignSystem/BaseComponents/ChallengesList/ChallengesListCell.dart';
import 'package:fiero/DesignSystem/Tokens.dart';
import 'package:fiero/QuickChallenge/Challenge%20Type.dart';
import 'package:fiero/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Controller controller;
  List items = ["1","2","3"];
  List<QuickChallenge> challengesAll = [];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    controller = Provider.of<Controller>(context);
  }

  @override
  void didUpdateWidget(covariant Home oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    controller.getChallenges().then((dados) {
      challengesAll = dados;
      controller.quickChallenge = dados;
    });
  }



  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: colorNeutralBackground(),
        child: RefreshIndicator(
          onRefresh: () async {
            controller.getChallenges().then((dados) {
              challengesAll = dados;
              controller.quickChallenge = dados;
            });
          },
          color: colorNeutralHighPure(),
          backgroundColor: colorNeutralLowPure(),
          child: Padding(
              padding: EdgeInsets.all(spacingNano()),
              child: Observer(builder: (_){
                return ListView.builder(
                  itemCount: controller.quickChallenge.length+1,
                  itemBuilder: (context, index) {
                    if(index == 0){
                      return Padding(
                        padding: EdgeInsets.fromLTRB(spacingNano(), spacingXXXS(), spacingNano(), spacingXXS()),
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation1, animation2) => ChallengeType(),
                                        // transitionDuration: Duration.zero,
                                        // reverseTransitionDuration: Duration.zero,
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: colorNeutralHighPure(),
                                    size: fontSizeLG(),
                                    semanticLabel: 'Icone de criar novo desafio',
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    "Seus desafios",
                                    style: TextStyle(
                                        color: colorNeutralHighPure(),
                                        fontWeight: FontWeight.bold,
                                        fontSize: fontSizeLG(),
                                        height: 1),
                                    textAlign: TextAlign.left,
                                    maxLines: null,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Padding(
                        padding: EdgeInsets.only(bottom: spacingNano()),
                        child: ChallengesListCell(controller.quickChallenge[index-1]),
                      );
                    }
                  },
                );
              })
          ),
        )
      ),
    );
  }
}
