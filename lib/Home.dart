import 'dart:convert';

import 'package:fiero/Classes/QuickChallenge.dart';
import 'package:fiero/QuickChallenge/Challenge%20Type.dart';
import 'package:fiero/DesignSystem/BaseComponents/ChallengesListCell.dart';
import 'package:fiero/DesignSystem/Tokens.dart';
import 'package:fiero/controller.dart';
import 'package:flutter/material.dart';
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
  late List<QuickChallenge> challenges = [];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    controller = Provider.of<Controller>(context);
  }

  getChallenges() async {

    print("entrou");

    http.Response response;

    response = await http.get(
      Uri.parse('http://${getIP()}:3333/quickChallenge/createdByMe'),
      headers: {
        'authToken': '${controller.token}'
      },
    );

    Map<dynamic, dynamic> retorno = jsonDecode(response.body);

    print(retorno.length);

    for (int i = 0; i < retorno.length; i++) {
      challenges.add(QuickChallenge(retorno["quickChallenges"][0]["name"]));
    }
    print(challenges);

    if(response.statusCode.toString() == "200" ) {
      return response;
    }
    // print(response.body);
    return challenges;
  }

  @override
  void didUpdateWidget(covariant Home oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    getChallenges().then((dados) {
      print(dados[0]);
    });
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: colorNeutralBackground(),
        child: Padding(
          padding: EdgeInsets.all(spacingNano()),
          child: ListView.builder(
            itemCount: controller.quickChallenge.length+3,
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
                  child: ChallengesListCell("Vôlei do Academy", "Brenda e Marina", "MD5"),
                );
              }
            },
          ),
        )
      ),
    );
  }
}
