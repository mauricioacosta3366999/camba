import 'package:camba/Sections/header.dart';
import 'package:flutter/material.dart';

class Conversacion extends StatefulWidget {
  String nombreChat = '';
  Conversacion(this.nombreChat, {Key? key}) : super(key: key);

  @override
  _ConversacionState createState() => _ConversacionState();
}

class _ConversacionState extends State<Conversacion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(child: body()));
  }

  Widget body() {
    return Column(
      children: [
        Header(),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: ClipRRect(
            borderRadius: new BorderRadius.circular(100),
            child: Image.network(
              'https://cambachivache.net/avatar/avatar.jpg',
              fit: BoxFit.cover,
              height: 80,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text('Conversación con el usuario:',
              style: TextStyle(fontSize: 18)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            widget.nombreChat,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        )
      ],
    );
  }
}
