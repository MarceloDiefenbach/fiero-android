import 'dart:convert';

import 'package:fiero/DesignSystem/BaseComponents/Button.dart';
import 'package:fiero/DesignSystem/Tokens.dart';
import 'package:http/http.dart' as http;
import 'package:fiero/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VictoryParameter extends StatefulWidget {

  String type;
  String name;

  VictoryParameter(this.type, this.name);

  @override
  State<VictoryParameter> createState() => _VictoryParameterState();
}

class _VictoryParameterState extends State<VictoryParameter> {

  late Controller controller;
  TextEditingController _goalController = TextEditingController(text: '');


  // {
  // "name": "primeriasdasdo de muitos",
  // "type": "bestof",
  // "goal": 3,
  // "goalMeasure": "rounds"
  // }

  createQuickChallenge(String name, String type, String goal, String goalMeasure) async {

    Map data = {
      "name": name,
      "type": type,
      "goal": goal,
      "goalMeasure": goalMeasure
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
    return response.body;
  }


  @override
  Widget build(BuildContext context) {

    controller = Provider.of<Controller>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
                        color: colorBrandSecondary(),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: Container(
                        width: width*0.60,
                        height: 10,
                        color: colorBrandPrimary(),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 30)),
                Text(
                  "Vitória",
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
                  "Número de pontos necessários pra\nque alguém seja vencedor.",
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(top: height*0.3)),
                Container(
                  width: width*0.8,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: borderRadiusMedium(),
                      border: Border.all(color: Colors.transparent, width: 1)
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: spacingNano(), right: spacingNano()),
                    child: TextField(
                      scrollPadding: EdgeInsets.only(top:100),
                      controller: _goalController,
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      onChanged: (String e) {},
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '',
                        hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w100, color: colorNeutralHighPure()),
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: colorNeutralHighPure(),
                        fontSize: 30,
                      ),
                    ),
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
                        //CREATE CHALLENGE

                        createQuickChallenge(widget.name, widget.type, _goalController.text, "minutes").then((dados) {
                          print(dados);
                        });

                        // Navigator.pushReplacement(
                        //   context,
                        //   PageRouteBuilder(
                        //     pageBuilder: (context, animation1, animation2) => Home(),
                        //     transitionDuration: Duration.zero,
                        //     reverseTransitionDuration: Duration.zero,
                        //   ),
                        // );
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
                Padding(padding: EdgeInsets.only(bottom: 20)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
