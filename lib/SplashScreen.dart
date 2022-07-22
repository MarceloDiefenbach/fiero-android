import 'dart:async';
import 'dart:convert';
import 'package:fiero/CreateAccount.dart';
import 'package:fiero/Home.dart';
import 'package:fiero/Login.dart';
import 'package:fiero/controller.dart';
import 'package:http/http.dart' as http;

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
