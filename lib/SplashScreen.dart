import 'dart:async';
import 'dart:convert';
import 'package:fiero/Classes/OwnerTeam.dart';
import 'package:fiero/CreateAccount.dart';
import 'package:fiero/ChallengesList.dart';
import 'package:fiero/Login.dart';
import 'package:fiero/controller.dart';
import 'package:http/http.dart' as http;
import 'package:fiero/Classes/Members.dart';
import 'package:fiero/Classes/Owner.dart';
import 'package:fiero/Classes/QuickChallenge.dart';
import 'package:fiero/Classes/Team.dart';
import 'package:fiero/Classes/Teams.dart';

import 'package:fiero/DesignSystem/Tokens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui';

import 'DesignSystem/BaseComponents/Button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  TextEditingController _passwordController = TextEditingController(text: '');
  TextEditingController _emailController = TextEditingController(text: '');
  String userToken = "";
  Controller controller = Controller();
  Timer? timer;

  // getChallenges() async {
  //
  //   http.Response response;
  //
  //   response = await http.get(
  //     Uri.parse('http://${getIP()}:3333/quickChallenge/createdByMe'),
  //     headers: {
  //       'authToken': '${controller.token}'
  //     },
  //   );
  //
  //   Map<dynamic, dynamic> retorno = jsonDecode(response.body);
  //
  //
  //   List<Members> members = [];
  //   List<Teams> teams = [];
  //   List<QuickChallenge> quickChallenges = [];
  //
  //   for (int i = 0; i < retorno["quickChallenges"].length; i++) {
  //
  //     print(" i ${i}");
  //     //Cria list de teams
  //     for (int a = 0; a < retorno["quickChallenges"][i]["teams"].length; a++) {
  //       Map<dynamic, dynamic> teamsMap = retorno["quickChallenges"][i]["teams"][a];
  //
  //       print(" a ${a}");
  //       //Cria a list de members
  //       for (int b = 0; b < retorno["quickChallenges"][i]["teams"].length; b++) {
  //         print(" b ${b}");
  //         Map<dynamic, dynamic> memebersMap = teamsMap["members"][b];
  //         print("asdasd ${memebersMap["team"]}");
  //         members.add(
  //           Members(
  //               memebersMap["id"],
  //               Team(
  //                   memebersMap["team"]["id"],
  //                   memebersMap["team"]["name"],
  //                   OwnerTeam(
  //                       memebersMap["team"]["owner"]["id"],
  //                       memebersMap["team"]["owner"]["email"],
  //                       memebersMap["team"]["owner"]["name"],
  //                       memebersMap["team"]["owner"]["createdAt"],
  //                       memebersMap["team"]["owner"]["updatedAt"]
  //                   ),
  //                   memebersMap["team"]["quickChallengeId"],
  //                   memebersMap["team"]["ownerId"],
  //                   memebersMap["team"]["createdAt"],
  //                   memebersMap["team"]["updatedAt"]
  //               ),
  //               memebersMap["score"],
  //               memebersMap["userId"],
  //               memebersMap["teamId"],
  //               memebersMap["createdAt"],
  //               memebersMap["updatedAt"]
  //           ),
  //         );
  //       }
  //
  //       teams.add(
  //           Teams(
  //               teamsMap["id"],
  //               teamsMap["name"],
  //               Owner(
  //                   teamsMap["owner"]["id"],
  //                   teamsMap["owner"]["email"],
  //                   teamsMap["owner"]["name"],
  //                   teamsMap["owner"]["createdAt"],
  //                   teamsMap["owner"]["updatedAt"]
  //               ),
  //               teamsMap["quickChallengeId"],
  //               teamsMap["ownerId"],
  //               teamsMap["createdAt"],
  //               teamsMap["updatedAt"],
  //               members
  //           )
  //       );
  //     }
  //
  //     quickChallenges.add(
  //         QuickChallenge(
  //             retorno["quickChallenges"][i]["id"],
  //             retorno["quickChallenges"][i]["name"],
  //             retorno["quickChallenges"][i]["invitationCode"],
  //             retorno["quickChallenges"][i]["type"],
  //             retorno["quickChallenges"][i]["goal"],
  //             retorno["quickChallenges"][i]["goalMeasure"],
  //             retorno["quickChallenges"][i]["finished"],
  //             retorno["quickChallenges"][i]["ownerId"],
  //             retorno["quickChallenges"][i]["createdAt"],
  //             retorno["quickChallenges"][i]["updatedAt"],
  //             teams,
  //             Owner(
  //                 "",
  //                 retorno["quickChallenges"][i]["owner"]["email"],
  //                 retorno["quickChallenges"][i]["owner"]["name"],
  //                 retorno["quickChallenges"][i]["owner"]["createdAt"],
  //                 retorno["quickChallenges"][i]["owner"]["updatedAt"]
  //             )
  //         )
  //     );
  //   }
  //
  //   if(response.statusCode.toString() == "201" ) {
  //     return quickChallenges;
  //   }
  //   return response.statusCode;
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    controller = Provider.of<Controller>(context);

    // getChallenges().then((dados) {
    //   print("entrou");
    //   controller.quickChallenge = dados;
    //   print(controller.quickChallenge);
    // });

    timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      controller.updateCredentials();
      bool auth = controller.auth;
      controller.verifiyAuth(controller);
      if(auth){
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => Home(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => Login(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      }
    });
  }


  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: colorBrandPrimary(),
        child: Stack(
          children: [
            Image.asset('assets/login/login-background.png',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
