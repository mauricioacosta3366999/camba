import 'dart:convert';

import 'package:camba/Api/Models/categories.dart';
import 'package:camba/Api/consultas.dart';
import 'package:camba/Pages/cambaCreado.dart';
import 'package:flutter/material.dart';
import 'package:camba/Sections/header.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

import 'package:shared_preferences/shared_preferences.dart';

class sendProposal extends StatefulWidget {
  sendProposalState createState() => sendProposalState();
}

class sendProposalState extends State<sendProposal> {
//controlladores
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
//variables
  File? _image;
  final picker = ImagePicker();
  final picker2 = ImagePicker();
  List imagenes = [];
  List imagenes2 = [];
  List categoriasSeleccionadas = [];
  List<String> imagenes64 = [];
  List<String> imagenes642 = [];
  late Categories categories;
  var categorySelected = '';
  var loader = false;

  Map<String, dynamic> data = {};
  List<Widget> childrens = [];

  Map<String, dynamic> newCamba = {
    "titulo_camba": '',
    "descripcion": '',
    "precio_estimado": '',
    "categoria_ids": '',
    "user_id": '',
    "tipo": '3',
    "camba_id": '1'
  };

  Future<void> crearCanva() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final createUrl =
          Uri.parse('https://cambachivache.net:9000/api/cambas/crear');
      var userId = prefs.getInt('userId');

      setState(() {
        // TODO: Asigned user_id.

        // No se asigno el valor del preferences porque podes entrar a esta
        // seccion sin estar logueado lo cual crea un error al consultar el dato del shared_preferences.
        // faltaría agregar una validación para que sólo entre usuarios logueados.
        newCamba['titulo_camba'] = 'No aplica';
        newCamba['user_id'] = userId.toString();
        newCamba['tipo'] = '3';
      });

      final res = await http.post(createUrl, body: newCamba);

      final response = json.decode(res.body);

      print('response tipo3');

      print(newCamba);

      print(response.toString());

      if (res.statusCode == 200) {
        uploadConvertAndUpload(response['id'].toString());
      } else {
        // TODO: View error message.
        print("Ocurrio un error");
      }
    } catch (_) {
      // TODO: View catch message.
      print("Error crate camba");
    }
  }

  void uploadConvertAndUpload(cambiaId) async {
    //levantar imagenes de lo que tengo
    imagenes64.forEach((element) {
      imageUpload(element, cambiaId);
    });
    //levantar imagenes de lo que quiero
    imagenes642.forEach((element) {
      imageUpload(element, cambiaId);
    });
  }

  Future<bool> imageUpload(img64, cambiaId) async {
    final createUrl =
        Uri.parse('https://cambachivache.net/api/cambas/guardar_imagen');

    Map<String, dynamic> body = {
      "camba_id": cambiaId.toString(),
      "imagen": "data:image/jpeg;base64," + img64.toString()
    };

    // developer.log(body.toString());

    final res = await http.post(createUrl, body: body);

    if (res.statusCode == 200)
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: _body(),
    ));
  }

//Funciones :

//OBTENER CATEGORIAS.

  void initState() {
    super.initState();
    _inicializate();
  }

  void _inicializate() async {
    categories = await Consultas().getCategories();
  }

//OBTENER IMAGENES DEL CAMBA.
  Future<void> getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    // final File file = File(pickedFile!.path);
    final bytes = await pickedFile!.readAsBytes();

    final base64 = base64Encode(bytes);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        imagenes.add(_image);
        imagenes64.add(base64);
      } else {
        print('No image selected.');
      }
    });
  }

//Cuerpo de la pantalla

  Widget _body() {
    return Column(
      children: [
        Header(),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 8, right: 8, bottom: 0),
          child: Text(
            'Ponete en contacto con el publicante',
            style: TextStyle(fontSize: 23),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 3, 20, 0),
          margin: EdgeInsets.only(left: 10, right: 10, top: 25),
          height: 150,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            maxLines: 5,
            onChanged: (value) {
              setState(() {
                newCamba['descripcion'] = value;
              });
            },
            cursorColor: Colors.black,
            controller: descriptionController,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Escrbile una propuesta',
              hintStyle: TextStyle(color: Colors.black),
            ),
            style: TextStyle(color: Colors.black),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(30, 3, 0, 0),
          margin: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
          height: 60,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            onChanged: (value) {
              setState(() {
                newCamba['precio_estimado'] = value.toString();
              });
            },
            keyboardType: TextInputType.number,
            cursorColor: Colors.black,
            controller: priceController,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Agregá un precio referencial en Gs.',
              hintStyle: TextStyle(color: Colors.black),
            ),
            style: TextStyle(color: Colors.black),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.yellow,
          ),
          margin: EdgeInsets.all(10),
          height: 280,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/camera-icon.png',
                height: 100,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, right: 5),
                child: Text('Subí la imagen de lo que tenés'),
              ),
              GestureDetector(
                onTap: () {
                  if (imagenes.length < 4) {
                    getImage();
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.only(left: 60, top: 15, right: 60),
                  height: 40,
                  width: 170,
                  child: Text(
                    'Buscar Imagen',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              Row(
                  mainAxisAlignment: imagenes.length > 1
                      ? MainAxisAlignment.spaceAround
                      : MainAxisAlignment.start,
                  children: [
                    for (var i = 0; i < imagenes.length; i++)
                      _image == null
                          ? Container()
                          : Container(
                              margin:
                                  EdgeInsets.only(right: 10, left: 10, top: 10),
                              color: Colors.grey,
                              height: 60,
                              width: 60,
                              child: Stack(
                                children: [
                                  Container(
                                      height: 60,
                                      width: 60,
                                      child: Image.file(imagenes[i])),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        imagenes.remove(imagenes[i]);
                                      });
                                    },
                                    child: Container(
                                        height: 15,
                                        width: 15,
                                        color: Colors.red,
                                        child: Icon(
                                          Icons.close,
                                          size: 15,
                                        )),
                                  ),
                                ],
                              ),
                            )
                  ]),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            crearCanva();
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 15, bottom: 60),
            height: 40,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xff444444)),
            child: Text('Enviar Mensaje',
                style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
        ),
      ],
    );
  }
}
