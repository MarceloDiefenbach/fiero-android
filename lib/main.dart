import 'package:fiero/Login.dart';
import 'package:fiero/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller.dart';

void main() {
  runApp(Provider(
      create: (_) => Controller(),
    child: MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}

