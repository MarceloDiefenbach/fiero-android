import 'package:fiero/DesignSystem/BaseComponents/ChallengesListCell.dart';
import 'package:fiero/DesignSystem/Tokens.dart';
import 'package:fiero/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Controller controller;
  List items = ["1","2","3"];

  @override
  Widget build(BuildContext context) {

    controller = Provider.of<Controller>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: colorNeutralBackground(),
        child: Padding(
          padding: EdgeInsets.all(spacingNano()),
          child: ListView.builder(
            itemCount: items.length+1,
            itemBuilder: (context, index) {
              if(index == 0){
                return Padding(
                  padding: EdgeInsets.fromLTRB(spacingNano(), spacingXXXS(), spacingNano(), spacingXXS()),
                  child: Row(
                    children: [
                      Text(
                        "Seus desafios",
                        style: TextStyle(
                            color: colorNeutralHighPure(),
                            fontWeight: FontWeight.bold,
                            fontSize: fontSizeLG()),
                        textAlign: TextAlign.left,
                      ),
                      Spacer(),
                      Icon(
                        Icons.add,
                        color: colorNeutralHighPure(),
                        size: fontSizeLG(),
                        semanticLabel: 'Icone de criar novo desafio',
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
