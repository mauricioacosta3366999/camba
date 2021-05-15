import 'package:camba/Home/home.dart';
import 'package:camba/Pages/homeInit.dart';
import 'package:camba/Sections/header.dart';
import 'package:flutter/material.dart';

class MisCambas extends StatefulWidget {
  _MisCambasState createState() => _MisCambasState();
}

class _MisCambasState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Header(),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            'MIS CAMBAS',
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
