import 'package:camba/Api/consultas.dart';
import 'package:camba/Pages/conversacion.dart';
import 'package:camba/Sections/header.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  var respuesta;
  @override
  void initState() {
    super.initState();
    consultar();
  }

  void consultar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getInt('userId')!;
    respuesta = await Consultas().chats(userId);
    print('esta es la respuesta del chat: $respuesta');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: body(),
    );
  }

  Widget body() {
    return Column(
      children: [
        Header(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Mis Mensajes',
            style: TextStyle(fontSize: 20),
          ),
        ),
        if (respuesta != null)
          for (var i = 0; i < respuesta.length; i++)
            Container(
              margin: EdgeInsets.only(left: 10, top: 20, right: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 15, bottom: 5),
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(100),
                              child: Image.network(
                                "https://cambachivache.net:9000//avatar/avatar.jpg",
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, bottom: 10),
                                width: 200,
                                child: Text(
                                  'Mensaje de ' +
                                      respuesta[i]["nombre_emisor"] +
                                      ' :',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, bottom: 10),
                                width: 200,
                                child: Text(
                                  'Mensaje de ' + respuesta[i]["titulo_camba"],
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Conversacion(
                                            respuesta[i]["nombre_emisor"],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          color: Colors.grey[300],
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(
                                          left: 10, bottom: 5, top: 5),
                                      height: 35,
                                      child: Text(
                                        'Ver Conversación',
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(left: 10, top: 5),
                                      height: 35,
                                      child: Text('Camba Concretado'),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
      ],
    );
  }
}
