import 'package:fiero/Functions/saveAndGetMemory.dart';
import 'package:mobx/mobx.dart';

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

  @action
  void saveUser(String nameP, String emailP, String passwordP) {
    email = emailP;
  }

  @action
  void doLogin(String email, String password) async {
    doAuth(email, password).then((dados) {

      if (dados == "erro") {

      } else {
        if (dados["token"] != Null) {

          saveEmail(dados["user"]["email"]);
          saveName(dados["user"]["name"]);


          print(dados["user"]["name"]);
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
  }

  @action
  void verifiyAuth(Controller controller) async {

    doAuth(controller.email, controller.password).then((dados) {

      if (dados == "erro") {

      } else {
        if (dados["token"] != Null) {

          saveEmail(dados["user"]["email"]);
          saveName(dados["user"]["name"]);


          print(dados["user"]["name"]);
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
}