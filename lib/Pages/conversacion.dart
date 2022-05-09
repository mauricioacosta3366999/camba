import 'package:camba/Api/Models/obtenerCambas.dart';
import 'package:camba/Api/consultas.dart';
import 'package:camba/Sections/header.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Conversacion extends StatefulWidget {
  String contactName = '';
  String propuestaId = '';
  Conversacion(this.contactName, this.propuestaId, {Key? key})
      : super(key: key);

  @override
  _ConversacionState createState() => _ConversacionState();
}

class _ConversacionState extends State<Conversacion> {
  var messageController = TextEditingController();
  var mensajesEnviados = '';
  var loader = true;
  var messages = [];
  var respuesta;
  var userId;
  var propuestaId;
  var envioMensaje;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [body()],
    ));
  }

  @override
  void initState() {
    super.initState();
    inicializar();
  }

  void inicializar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('userId')!;
    print('este es el id user conversatio $userId');
    propuestaId = widget.propuestaId.toString();
    var apiResponse = await Consultas().conversaciones(userId, propuestaId);
    print('esta es la respuesta de la conversacion: $apiResponse');
    loader = false;
    setState(() {
      propuestaId = widget.propuestaId.toString();
      userId = prefs.getInt('userId')!;
      respuesta = apiResponse;
      loader = false;
    });
  }

  void sendMessage(message) async {
    var envioMensajeResponse =
        await Consultas().sendMessage(userId, propuestaId, message);
    setState(() {
      envioMensaje = envioMensajeResponse;
    });
  }

  Widget body() {
    return Expanded(
      child: Container(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
                child: Column(
              children: [
                loader == false
                    ? Column(
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
                            padding: const EdgeInsets.only(top: 5, bottom: 15),
                            child: Text(
                              widget.contactName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Header(),
                          Container(
                            margin: EdgeInsets.only(top: 50),
                            child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.yellow)),
                          ),
                        ],
                      ),
                if (respuesta != null)
                  for (var i = 0; i < respuesta.length; i++)
                    Column(
                      children: [
                        userId != respuesta[i]["emisor_id"]
                            ? Row(
                                children: [
                                  // Padding(
                                  //   padding: const EdgeInsets.only(left: 10),
                                  //   child: Text('21:10'),
                                  // ),
                                  Container(
                                    constraints: BoxConstraints(
                                        minWidth: 10, maxWidth: 200),
                                    decoration: BoxDecoration(
                                      color: Colors.yellow[200],
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.only(
                                        top: 5, bottom: 5, right: 10, left: 10),
                                    margin: EdgeInsets.only(
                                        left: 5, bottom: 5, top: 5),
                                    child: Text(respuesta[i]["mensaje"]),
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                      constraints: BoxConstraints(
                                          minWidth: 10, maxWidth: 200),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: EdgeInsets.only(
                                          top: 5,
                                          bottom: 5,
                                          right: 10,
                                          left: 10),
                                      margin: EdgeInsets.only(
                                          right: 5, top: 5, bottom: 5),
                                      child: Text(respuesta[i]["mensaje"])),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(right: 10),
                                  //   child: Text('21:10'),
                                  // ),
                                ],
                              ),
                      ],
                    ),
                for (var i = 0; i < messages.length; i++)
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              constraints:
                                  BoxConstraints(minWidth: 10, maxWidth: 200),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.only(
                                  top: 5, bottom: 5, right: 10, left: 10),
                              margin:
                                  EdgeInsets.only(right: 5, top: 5, bottom: 5),
                              child: Text(messages[i].toString())),
                          // Padding(
                          //   padding: const EdgeInsets.only(right: 10),
                          //   child: Text('21:10'),
                          // ),
                        ],
                      ),
                    ],
                  ),
                SizedBox(
                  height: 100,
                )
              ],
            )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: messageEdit(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget messageEdit() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(10),
      child: Container(
          padding: EdgeInsets.only(left: 15),
          margin: EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            cursorColor: Colors.black,
            controller: messageController,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: Icon(Icons.send),
                color: Colors.grey,
                onPressed: () {
                  if (messageController.value.text.isNotEmpty) {
                    var message = messageController.value.text.toString();
                    setState(() {
                      messages.add(message);
                      sendMessage(message);
                      messageController.text = '';
                    });
                  }
                },
              ),
              hintText: 'Escribe un nuevo mensaje',
              hintStyle: TextStyle(color: Colors.black),
            ),
            style: TextStyle(color: Colors.black),
          )),
    );
  }
}
