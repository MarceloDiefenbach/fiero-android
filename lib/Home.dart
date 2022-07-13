import 'package:fiero/DesignSystem/Tokens.dart';
import 'package:fiero/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Controller controller;

  @override
  Widget build(BuildContext context) {

    controller = Provider.of<Controller>(context);

    return Container(
      color: colorBrandPrimary(),
      child: Text(controller.email,
      style: TextStyle(color: Colors.white),),
    );
  }
}
