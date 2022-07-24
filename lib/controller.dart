import 'dart:convert';

import 'package:fiero/Classes/Members.dart';
import 'package:fiero/Classes/Owner.dart';
import 'package:fiero/Classes/OwnerTeam.dart';
import 'package:fiero/Classes/QuickChallenge.dart';
import 'package:fiero/Classes/Team.dart';
import 'package:fiero/Classes/Teams.dart';
import 'package:fiero/DesignSystem/Tokens.dart';
import 'package:fiero/Functions/saveAndGetMemory.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {

  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  String name = "";

  @observable
  bool auth = false;

  @observable
  String token = "";

  @observable
  List<QuickChallenge> quickChallenge = [];

  @action
  addChallenge(QuickChallenge challenge){
    quickChallenge.add(challenge);
  }

  @action
  void saveUser(String nameP, String emailP, String passwordP) {
    email = emailP;
  }

  @action
  void doLogin(String email, String password) {
    doAuth(email, password).then((dados) {

      if (dados == "erro") {

      } else {
        if (dados["token"] != Null) {

          saveEmail(dados["user"]["email"]);
          saveName(dados["user"]["name"]);
          saveToken(dados["token"]);

          //success
          auth = true;
          return true;

        } else {
          //error
          //here we can return the erro type
          print("erro");
          auth = false;
          return false;
        }
      }
    });
  }

  updateCredentials() async {
    email = await getEmail();
    password = await getPassword();
    token = await getToken();
  }

  @action
  void verifiyAuth(Controller controller) {

    doAuth(controller.email, controller.password).then((dados) {

      if (dados == "erro") {

      } else {
        if (dados["token"] != Null) {

          saveEmail(dados["user"]["email"]);
          saveName(dados["user"]["name"]);
          saveToken(dados["token"]);
          token = dados["token"];

          //success
          auth = true;
          return true;

        } else {
          //error
          //here we can return the erro type
          print("erro");
          auth = false;
          return false;
        }
      }
    });
  }

  getChallenges() async {

    http.Response response;

    response = await http.get(
      Uri.parse('http://${getIP()}:3333/quickChallenge/createdByMe'),
      headers: {
        'authToken': '${token}'
      },
    );

    Map<dynamic, dynamic> retorno = jsonDecode(response.body);

    List<Members> members = [];
    List<Teams> teams = [];
    List<QuickChallenge> quickChallenges = [];

    for (int i = 0; i < retorno["quickChallenges"].length; i++) {
      // print("quick ${i}");
      teams.clear();
      members.clear();

      //Cria list de teams
      for (int a = 0; a < retorno["quickChallenges"][i]["teams"].length; a++) {

        // print("teams ${a}");
        Map<dynamic, dynamic> teamsMap = retorno["quickChallenges"][i]["teams"][a];
        for (int b = 0; b < retorno["quickChallenges"][i]["teams"].length; b++) {

          // print("members ${b}");
          Map<dynamic, dynamic> memebersMap = teamsMap["members"][b];
          members.add(
            Members(
                memebersMap["id"],
                Team(
                    memebersMap["team"]["id"],
                    memebersMap["team"]["name"],
                    OwnerTeam(
                        memebersMap["team"]["owner"]["id"],
                        memebersMap["team"]["owner"]["email"],
                        memebersMap["team"]["owner"]["name"],
                        memebersMap["team"]["owner"]["createdAt"],
                        memebersMap["team"]["owner"]["updatedAt"]
                    ),
                    memebersMap["team"]["quickChallengeId"],
                    memebersMap["team"]["ownerId"],
                    memebersMap["team"]["createdAt"],
                    memebersMap["team"]["updatedAt"]
                ),
                memebersMap["score"].toDouble(),
                memebersMap["userId"],
                memebersMap["teamId"],
                memebersMap["createdAt"],
                memebersMap["updatedAt"]
            ),
          );
          // print(members);
        }

        teams.add(
            Teams(
                teamsMap["id"],
                teamsMap["name"],
                Owner(
                    teamsMap["owner"]["id"],
                    teamsMap["owner"]["email"],
                    teamsMap["owner"]["name"],
                    teamsMap["owner"]["createdAt"],
                    teamsMap["owner"]["updatedAt"]
                ),
                teamsMap["quickChallengeId"],
                teamsMap["ownerId"],
                teamsMap["createdAt"],
                teamsMap["updatedAt"],
                members
            )
        );
      }
      quickChallenges.add(
          QuickChallenge(
              retorno["quickChallenges"][i]["id"],
              retorno["quickChallenges"][i]["name"],
              retorno["quickChallenges"][i]["invitationCode"],
              retorno["quickChallenges"][i]["type"],
              retorno["quickChallenges"][i]["goal"].toDouble(),
              retorno["quickChallenges"][i]["goalMeasure"],
              retorno["quickChallenges"][i]["finished"],
              retorno["quickChallenges"][i]["ownerId"],
              retorno["quickChallenges"][i]["createdAt"],
              retorno["quickChallenges"][i]["updatedAt"],
              teams,
              Owner(
                  "",
                  retorno["quickChallenges"][i]["owner"]["email"],
                  retorno["quickChallenges"][i]["owner"]["name"],
                  retorno["quickChallenges"][i]["owner"]["createdAt"],
                  retorno["quickChallenges"][i]["owner"]["updatedAt"]
              )
          )
      );
    }

    if(response.statusCode.toString() == "201" ) {
      print("foi");
      print(quickChallenges);
      return quickChallenges;
      // return response.statusCode;
    }
    return response.statusCode;
  }
}