import 'package:camba/Api/Models/categories.dart';
import 'package:camba/Api/consultas.dart';
import 'package:flutter/material.dart';
import 'package:camba/Sections/header.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class cambaCreate extends StatefulWidget {
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
  final picker = ImagePicker();
  List imagenes = [];
  late Categories categories;
  var categorySelected = '';

  Map<String, dynamic> data = {};
  List<Widget> childrens = [];

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
      // print(element);
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
              ExpansionTile(
                title: GestureDetector(
                  onTap: () {
                    // var categoriaSeleccionada = listr[i][ai].toString();
                    setState(() {
                      categorySelected = listr[i][ai].toString();
                    });
                  },
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
  }

//OBTENER IMAGENES DEL CAMBA.
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        imagenes.add(_image);
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
          child: TextField(
            cursorColor: Colors.black,
            controller: titleController,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Título del camba',
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    Container(
                                        height: 15,
                                        width: 15,
                                        color: Colors.red,
                                        child: Icon(
                                          Icons.close,
                                          size: 15,
                                        )),
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
          child: TextField(
            maxLines: null,
            cursorColor: Colors.black,
            controller: descriptionController,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Descripción de lo que tienes',
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
          child: TextField(
            keyboardType: TextInputType.number,
            cursorColor: Colors.black,
            controller: priceController,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Precio referencial en Gs',
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
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                for (var i = 0; i < imagenes.length; i++)
                  _image == null
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
                                  child: Image.file(imagenes[i])),
                              Container(
                                  height: 15,
                                  width: 15,
                                  color: Colors.red,
                                  child: Icon(
                                    Icons.close,
                                    size: 15,
                                  )),
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
          child: TextField(
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
          child: TextField(
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
        Container(
          margin: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
          child: ExpansionTile(
            title: Text(
              categorySelected == ''
                  ? "Seleccioná las categorias de este camba"
                  : categorySelected,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () async {
                var titleCamba = titleController.value.text;
                var descriptionCamba = descriptionController.value.text;
                var priceCamba = 10000;
                var categoriesId = '';
                var tipoCamba = 1;
                var idCamba = 0;
                var apiResponse = await Consultas().cambaCreate(
                    titleCamba,
                    descriptionCamba,
                    priceCamba,
                    categoriesId,
                    tipoCamba,
                    idCamba);
                print('esto es la creacion de un camba');
                print(apiResponse);
              },
              child: Container(
                alignment: Alignment.center,
                margin:
                    EdgeInsets.only(left: 40, right: 40, bottom: 50, top: 20),
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
                margin:
                    EdgeInsets.only(left: 40, right: 40, bottom: 50, top: 20),
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
        ),
      ],
    );
  }
}
