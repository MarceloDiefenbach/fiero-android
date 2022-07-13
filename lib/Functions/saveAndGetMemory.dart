import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

String ip = "192.168.25.93";

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



doAuth(String email, String password) async {

  Map data = {
    "email": email,
    "password": password,
  };

  var jsonData = jsonEncode(data);

  http.Response response;

  response = await http.post(
    Uri.parse('http://${ip}:3333/user/login'),
    headers: {'Content-Type': 'application/json'},
    body: jsonData,
  );

  Map<dynamic, dynamic> retorno = jsonDecode(response.body);

  if(response.statusCode.toString() == "200" ) {
    // print("${retorno["user"]["name"]} aposkdpaksodpaoksdpo");

    saveEmail(retorno["user"]["email"]);
    savePassword(retorno["user"]["password"]);
    saveName(retorno["user"]["name"]);
    return retorno;
  }
  return "erro";
}