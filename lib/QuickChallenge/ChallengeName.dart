import 'package:fiero/DesignSystem/BaseComponents/Button.dart';
import 'package:fiero/DesignSystem/Tokens.dart';
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
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 50)),
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
                        width: width*0.30,
                        height: 10,
                        color: colorBrandPrimary(),
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
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) => VictoryParameter(widget.type, _nameController.text),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                        );
                      },
                      child: Button("Próximo", width)
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
