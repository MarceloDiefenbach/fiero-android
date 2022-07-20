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

  @observable
  String token = "";

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
}