import 'package:fiero/DesignSystem/BaseComponents/Button.dart';
import 'package:fiero/DesignSystem/Tokens.dart';
import 'package:fiero/QuickChallenge/ChallengeBestOfType.dart';
import 'package:fiero/QuickChallenge/ChallengeTime.dart';
import 'package:fiero/QuickChallenge/ChallengeTimeType.dart';
import 'package:fiero/QuickChallenge/VictoryParameter.dart';
import 'package:fiero/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChallengeName extends StatefulWidget {

  String type;

  ChallengeName(this.type);

  @override
  State<ChallengeName> createState() => _ChallengeNameState();
}

class _ChallengeNameState extends State<ChallengeName> {

  late Controller controller;
  TextEditingController _nameController = TextEditingController(text: '');


  @override
  Widget build(BuildContext context) {

    controller = Provider.of<Controller>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Color primary;
    Color secondary;

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
                          width: width*0.30,
                          height: 10,
                          color: returnSecondary(),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 30)),
                  Text(
                    "Nomeie seu desafio",
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
                      controller: _nameController,
                      keyboardType: TextInputType.text,
                      autofocus: true,
                      maxLines: null,
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
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(left: spacingXXXS(), right: spacingXXXS()),
                    child: GestureDetector(
                        onTap: () {
                          if (widget.type == "highest") {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation1, animation2) => VictoryParameter(widget.type, _nameController.text),
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                              ),
                            );
                          } else if (widget.type == "quickest"){
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation1, animation2) => ChallengeTimeType(widget.type, _nameController.text),
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                              ),
                            );
                          }  else if (widget.type == "bestof"){
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation1, animation2) => ChallengeBestOfType(widget.type, _nameController.text),
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                              ),
                            );
                          }
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
