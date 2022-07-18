import 'dart:convert';
import 'dart:io';

import 'package:fiero/Login.dart';
import 'package:http/http.dart' as http;

import 'package:fiero/DesignSystem/Tokens.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'DesignSystem/BaseComponents/Button.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  TextEditingController _nameController = TextEditingController(text: '');
  TextEditingController _passwordController = TextEditingController(text: '');
  TextEditingController _emailController = TextEditingController(text: '');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  sendRequest(String name, String email, String password) async {

    Map data = {
      "name": name,
      "email": email,
      "password": password,
    };
    var jsonData = jsonEncode(data);

    http.Response response;

    response = await http.post(
      Uri.parse('http://${getIP()}:3333/user/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonData,
    );

    Map<dynamic, dynamic> retorno = jsonDecode(response.body);
    print(retorno);
    print(retorno["message"]);
    print(retorno["message"]["id"]);
    print(retorno["message"]["name"]);
    print(retorno["message"]["email"]);
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
            SingleChildScrollView(
              // controller: _scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.transparent,
                    height: 300,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: width*0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: colorNeutralHighPure(), width: 0.5),
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(spacingQuarck(height), spacingXS(height), spacingQuarck(height), spacingXS(height)),
                                child: Column(
                                  children: [
                                    Text(
                                      "Boas vindas, desafiante",
                                      style: TextStyle(
                                          color: colorNeutralHighPure(),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                    Padding(padding: EdgeInsets.all(spacingNano(height))),
                                    Container(
                                      width: width*0.8,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: borderRadiusMedium(),
                                          border: Border.all(color: colorNeutralHighPure(), width: 1)
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: spacingNano(height), right: spacingNano(height)),
                                        child: TextField(
                                          controller: _nameController,
                                          keyboardType: TextInputType.text,
                                          autofocus: false,
                                          onChanged: (String e) {},
                                          textInputAction: TextInputAction.done,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Nome',
                                            hintStyle: TextStyle(fontSize: fontSizeSM(), fontWeight: FontWeight.w100, color: colorNeutralHighPure()),
                                          ),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: colorNeutralHighPure(),
                                            fontSize: fontSizeSM(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(spacingNano(height))),
                                    Container(
                                      width: width*0.8,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: borderRadiusMedium(),
                                          border: Border.all(color: colorNeutralHighPure(), width: 1)
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: spacingNano(height), right: spacingNano(height)),
                                        child: TextField(
                                          controller: _emailController,
                                          keyboardType: TextInputType.text,
                                          autofocus: false,
                                          onChanged: (String e) {},
                                          textInputAction: TextInputAction.done,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'E-mail',
                                            hintStyle: TextStyle(fontSize: fontSizeSM(), fontWeight: FontWeight.w100, color: colorNeutralHighPure()),
                                          ),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: colorNeutralHighPure(),
                                            fontSize: fontSizeSM(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(spacingNano(height))),
                                    Container(
                                      width: width*0.8,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: borderRadiusMedium(),
                                          border: Border.all(color: colorNeutralHighPure(), width: 1)
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: spacingNano(height), right: spacingNano(height)),
                                        child: TextField(
                                          obscureText: true,
                                          enableSuggestions: false,
                                          autocorrect: false,
                                          controller: _passwordController,
                                          keyboardType: TextInputType.text,
                                          autofocus: false,
                                          onChanged: (String e) {},
                                          textInputAction: TextInputAction.done,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Senha',
                                            hintStyle: TextStyle(fontSize: fontSizeSM(), fontWeight: FontWeight.w100, color: colorNeutralHighPure()),
                                          ),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: colorNeutralHighPure(),
                                            fontSize: fontSizeSM(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(spacingXXS(height))),
                                    GestureDetector(
                                      child: Button("Criar conta", width),
                                      onTap: () {
                                        sendRequest(_nameController.text, _emailController.text, _passwordController.text);
                                      },
                                    ),
                                    Padding(padding: EdgeInsets.all(spacingNano(height))),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Já tem uma conta?",
                                          style: TextStyle(
                                              color: colorNeutralHighPure(),
                                              fontWeight: FontWeight.normal,
                                              fontSize: fontSizeXXS()),
                                          textAlign: TextAlign.center,
                                        ),
                                        Padding(padding: EdgeInsets.all(2)),
                                        GestureDetector(
                                          child: Text(
                                            "Faça login!",
                                            style: TextStyle(
                                                color: colorNeutralHighPure(),
                                                fontWeight: FontWeight.bold,
                                                fontSize: fontSizeXXS()),
                                            textAlign: TextAlign.center,
                                          ),
                                          onTap: () {
                                            Navigator.pushReplacement(
                                              context,
                                              PageRouteBuilder(
                                                pageBuilder: (context, animation1, animation2) => Login(),
                                                transitionDuration: Duration.zero,
                                                reverseTransitionDuration: Duration.zero,
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.transparent,
                    height: 300,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
