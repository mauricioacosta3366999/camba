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

class cambaCreate extends StatefulWidget {
  String titleEdit;
  String descriptionEdit;
  String priceEdit1;
  cambaCreate(this.titleEdit, this.descriptionEdit, this.priceEdit1, {Key? key})
      : super(key: key);

  cambaCreateState createState() => cambaCreateState();
}

class cambaCreateState extends State<cambaCreate> {
//controlladores
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final descriptionController2 = TextEditingController();
  final priceController = TextEditingController();
  final priceController2 = TextEditingController();
//variables
  File? _image;
  File? _image2;
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
  var categoriesCrear = {};

  Map<String, dynamic> data = {};
  List<Widget> childrens = [];

  Map<String, dynamic> newCamba = {
    "titulo_camba": '',
    "descripcion": '',
    "precio_estimado": '',
    "categoria_ids": '',
    "user_id": '',
    "tipo": '1',
    "camba_id": '1'
  };
  Map<String, dynamic> newCamba2 = {
    "titulo_camba": '',
    "descripcion": '',
    "precio_estimado": '',
    "categoria_ids": '',
    "user_id": '',
    "tipo": '1',
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
        newCamba['user_id'] = userId.toString();
        newCamba['tipo'] = '1';
      });

      final res = await http.post(createUrl, body: newCamba);

      final response = json.decode(res.body);

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

  Future<void> crearCanva2() async {
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
        newCamba2['user_id'] = userId.toString();
        newCamba2['tipo'] = '2';
      });

      final res = await http.post(createUrl, body: newCamba2);

      final response = json.decode(res.body);
      print('esto es parte de la segunda llamada');
      print(response.toString());

      if (res.statusCode == 200) {
        uploadConvertAndUpload(response['id'].toString());
      } else {
        // TODO: View error message.
        print("Ocurrio un error");
      }
    } catch (_) {
      // TODO: View catch message.
      print("Error crate camba lo que quiero");
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
  bool llave = false;

  loadJsonData() async {
    categories = await Consultas().getCategories();
    List titulos = [];
    List subtitulos = [];
    List listtem = [];
    List<List> listr = [];
    data = categories.productos.toJson();
    titulos.addAll(data.keys);
    subtitulos.addAll(data.values);
    subtitulos.forEach((element) {
      if (element.toString() != "[]") {
        listtem.add(element.values);
      } else {
        listtem.add("[]");
      }
    });
    subtitulos.clear();
    subtitulos = listtem;
    subtitulos.forEach((element) {
      var ab = (element
          .toString()
          .replaceAll("(", "")
          .replaceAll(")", "")
          .split(', '));
      listr.add(ab);
    });

    listr.forEach((element) {
      // print('elemento : $element');
    });

    childrens = <Widget>[
      for (var i = 0; i < titulos.length; i++)
        ExpansionTile(
          title: Text(
            titulos[i].toString(),
            style: TextStyle(color: Colors.black),
          ),
          children: <Widget>[
            for (var ai = 0; ai < listr[i].length; ai++)
              GestureDetector(
                onTap: () {
                  var categoriaSeleccionada = listr[i][ai].toString();
                  categoriasSeleccionadas.add(categoriaSeleccionada);
                  setState(() {
                    categorySelected = listr[i][ai].toString();
                  });
                },
                child: ListTile(
                  title: GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        listr[i][ai].toString() == '[]'
                            ? ''
                            : listr[i][ai].toString(),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        )
    ];
    setState(() {
      llave = true;
    });
  }

  void initState() {
    super.initState();
    loadJsonData();
    _inicializate();
  }

  void _inicializate() async {
    categories = await Consultas().getCategories();
    categoriesCrear = await Consultas().getCategoriesCrear();
    print('este es el creador de categorias $categoriesCrear');
    // categoriesCrear.forEach((key, value) {
    //   print(key);
    //   print(value);
    // });
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

  Future<void> getImage2() async {
    final pickedFile2 = await picker2.getImage(source: ImageSource.gallery);

    // final File file = File(pickedFile!.path);
    final bytes = await pickedFile2!.readAsBytes();

    final base642 = base64Encode(bytes);

    setState(() {
      if (pickedFile2 != null) {
        _image2 = File(pickedFile2.path);
        imagenes2.add(_image2);
        imagenes642.add(base642);
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
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Creá tu camba',
            style: TextStyle(fontSize: 26),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
          margin: EdgeInsets.only(left: 10, top: 10, right: 10),
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            onChanged: (value) {
              setState(() {
                newCamba['titulo_camba'] = value;
              });
            },
            cursorColor: Colors.black,
            controller: titleController,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.titleEdit,
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
                                margin: EdgeInsets.only(
                                    right: 10, left: 10, top: 10),
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
            )),
        Container(
          padding: EdgeInsets.fromLTRB(20, 3, 20, 0),
          margin: EdgeInsets.only(left: 10, right: 10),
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
              hintText: widget.descriptionEdit,
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
              hintText: widget.priceEdit1,
              hintStyle: TextStyle(color: Colors.black),
            ),
            style: TextStyle(color: Colors.black),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Qué buscas a cambio?',
                style: TextStyle(fontSize: 23),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                '(opcional)',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[400],
          ),
          margin: EdgeInsets.all(10),
          height: 250,
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
                child: Text('Subí la imagen de lo que querés a cambio'),
              ),
              GestureDetector(
                onTap: () {
                  if (imagenes2.length < 4) {
                    getImage2();
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
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                for (var i = 0; i < imagenes2.length; i++)
                  _image2 == null
                      ? Container()
                      : Container(
                          margin: EdgeInsets.only(right: 10, left: 10, top: 10),
                          color: Colors.grey,
                          height: 60,
                          width: 60,
                          child: Stack(
                            children: [
                              Container(
                                  height: 60,
                                  width: 60,
                                  child: Image.file(imagenes2[i])),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    imagenes2.remove(imagenes2[i]);
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
        Container(
          padding: EdgeInsets.fromLTRB(20, 3, 20, 0),
          margin: EdgeInsets.only(left: 10, right: 10),
          height: 150,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            onChanged: (value) {
              setState(() {
                newCamba2['descripcion'] = value;
                newCamba2['titulo_camba'] = value;
              });
            },
            maxLines: null,
            cursorColor: Colors.black,
            controller: descriptionController2,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Descripción de lo que queres',
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
                newCamba['precio_estimado'] = value;
              });
            },
            keyboardType: TextInputType.number,
            cursorColor: Colors.black,
            controller: priceController2,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Precio referencial en Gs',
              hintStyle: TextStyle(color: Colors.black),
            ),
            style: TextStyle(color: Colors.black),
          ),
        ),
        Wrap(
          children: [
            for (var i = 0; i < categoriasSeleccionadas.length; i++)
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
                padding: EdgeInsets.only(left: 5, right: 8, top: 5),
                child: Wrap(
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            categoriasSeleccionadas
                                .remove(categoriasSeleccionadas[i]);
                          });
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        categoriasSeleccionadas[i].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
          child: ExpansionTile(
            title: Text(
              "Seleccioná las categorias de este camba",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            children: <Widget>[
              ExpansionTile(
                  title: Text(
                    'Categorias',
                  ),
                  children: childrens),
            ],
          ),
        ),
        loader == false
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        loader = true;
                      });
                      await crearCanva();
                      await crearCanva2();
                      var titleCamba = titleController.value.text;
                      var descriptionCamba = descriptionController.value.text;
                      var priceCamba = priceController.value.text.toString();
                      List cambaImages = imagenes;
                      var cambaId = 0;
                      String propuesta = 'no';
                      print(
                          'esto es la coleccion de imagenes al crear un camba $cambaImages');
                      if (imagenes.length != 0 &&
                          titleCamba.isNotEmpty &&
                          descriptionCamba.isNotEmpty &&
                          priceCamba.isNotEmpty &&
                          newCamba['user_id'] != '1') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CambaCreado(
                                  titleCamba,
                                  descriptionCamba,
                                  priceCamba,
                                  cambaImages,
                                  categoriasSeleccionadas,
                                  cambaId,
                                  propuesta)),
                        );
                        setState(() {
                          loader = false;
                        });
                      } else {
                        setState(() {
                          loader = false;
                        });
                        final snackBar = SnackBar(
                          backgroundColor: Colors.red,
                          content:
                              Text('Completa todos los campos obligatorios'),
                          action: SnackBarAction(
                            label: '',
                            onPressed: () {},
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                          left: 40, right: 40, bottom: 50, top: 20),
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.yellow),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          'Crear Camba',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                          left: 40, right: 40, bottom: 50, top: 20),
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff444444)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          'Cancelar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Container(
                margin: EdgeInsets.only(top: 20, bottom: 50),
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow)))
      ],
    );
  }
}
