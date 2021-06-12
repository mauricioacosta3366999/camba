import 'package:camba/Api/consultas.dart';
import 'package:camba/Home/home.dart';
import 'package:camba/Pages/homeInit.dart';
import 'package:camba/Sections/header.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class MisPropuestas extends StatefulWidget {
  _MisPropuestasState createState() => _MisPropuestasState();
}

class _MisPropuestasState extends State<MisPropuestas> {

  Consultas consultas = new Consultas();

  List misPropuestas = [];

  void propuestas() async {

    final result = await consultas.propuestasRecibidas();
    developer.log("Propuestas result"+result.toString());

    setState(() => misPropuestas = result);
  }

  @override
  void initState() {
    propuestas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_body()],
    );
  }

  Widget _body() {
    return Column(
      children: [
        Header(),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            'MIS PROPUESTAS',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Divider(
          color: Colors.grey,
          height: 15,
          thickness: 1,
        )
      ],
    );
  }
}