import 'dart:convert';
import 'package:fiero/DesignSystem/Tokens.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> prefs = SharedPreferences.getInstance();


saveEmail(String data) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString("email", data);
}

getEmail() async {
  String data;
  final prefs = await SharedPreferences.getInstance();
  data = prefs.getString("email") ?? "";
  print(data);
  return data;
}

savePassword(String data) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString("password", data);
}

getPassword() async {
  String data;
  final prefs = await SharedPreferences.getInstance();
  data = prefs.getString("password") ?? "";
  print(data);
  return data;
}

saveName(String data) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString("name", data);
}

getName() async {
  String data;
  final prefs = await SharedPreferences.getInstance();
  data = prefs.getString("name") ?? "";
  print(data);
  return data;
}

saveToken(String data) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString("token", data);
}

getToken() async {
  String data;
  final prefs = await SharedPreferences.getInstance();
  data = prefs.getString("token") ?? "";
  print(data);
  return data;
}

saveID(String data) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString("user_id", data);
}

getID() async {
  String data;
  final prefs = await SharedPreferences.getInstance();
  data = prefs.getString("user_id") ?? "";
  print(data);
  return data;
}


doAuth(String email, String password) async {

  Map data = {
    "email": email,
    "password": password,
  };

  var jsonData = jsonEncode(data);

  http.Response response;
  // print("1");
  response = await http.post(
    Uri.parse('http://${getIP()}:3333/user/login'),
    headers: {'Content-Type': 'application/json'},
    body: jsonData,
  );
  // print("2");

  Map<dynamic, dynamic> retorno = jsonDecode(response.body);

  if(response.statusCode.toString() == "200" ) {
    // print("${retorno["user"]["name"]} aposkdpaksodpaoksdpo");

    saveEmail(retorno["user"]["email"]);
    saveName(retorno["user"]["name"]);
    return retorno;
  }
  return "erro";
}