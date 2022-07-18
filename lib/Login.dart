import 'dart:async';
import 'dart:convert';
import 'package:fiero/CreateAccount.dart';
import 'package:fiero/Home.dart';
import 'package:fiero/controller.dart';
import 'package:http/http.dart' as http;

import 'package:fiero/DesignSystem/Tokens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui';

import 'DesignSystem/BaseComponents/Button.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _passwordController = TextEditingController(text: '');
  TextEditingController _emailController = TextEditingController(text: '');
  String userToken = "";
  Controller controller = Controller();
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  doAuth(String email, String password) async {

    Map data = {
      "email": email,
      "password": password,
    };

    var jsonData = jsonEncode(data);

    http.Response response;

    response = await http.post(
      Uri.parse('http://${getIP()}:3333/user/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonData,
    );

    Map<dynamic, dynamic> retorno = jsonDecode(response.body);
    print(retorno);
    return retorno;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    controller = Provider.of<Controller>(context);
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
            SingleChildScrollView(
              // controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    color: Colors.transparent,
                    height: 300,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
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
                                          scrollPadding: EdgeInsets.only(top:100),
                                          controller: _emailController,
                                          keyboardType: TextInputType.text,
                                          autofocus: false,
                                          onChanged: (String e) {},
                                          textInputAction: TextInputAction.done,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'E-mail',
                                            hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w100, color: colorNeutralHighPure()),
                                          ),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: colorNeutralHighPure(),
                                            fontSize: 20,
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
                                            hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w100, color: colorNeutralHighPure()),
                                          ),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: colorNeutralHighPure(),
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(spacingXXXS(height))),
                                    Text(
                                      "Esqueci minha senha",
                                      style: TextStyle(
                                          color: colorNeutralHighPure(),
                                          fontWeight: FontWeight.normal,
                                          fontSize: fontSizeXXS()),
                                      textAlign: TextAlign.center,
                                    ),
                                    Padding(padding: EdgeInsets.all(spacingXXXS(height))),
                                    GestureDetector(
                                      child: Button("Fazer login", width),
                                      onTap: () {
                                        controller.doLogin(_emailController.text, _passwordController.text);
                                      },
                                    ),
                                    Padding(padding: EdgeInsets.all(spacingNano(height))),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Ainda não tenho uma conta.",
                                          style: TextStyle(
                                              color: colorNeutralHighPure(),
                                              fontWeight: FontWeight.normal,
                                              fontSize: fontSizeXXS()),
                                          textAlign: TextAlign.center,
                                        ),
                                        Padding(padding: EdgeInsets.all(2)),
                                        GestureDetector(
                                          child: Text(
                                            "Criar conta!",
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
                                                pageBuilder: (context, animation1, animation2) => CreateAccount(),
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
