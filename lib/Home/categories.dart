import 'package:camba/Api/consultas.dart';
import 'package:camba/Pages/categoryFilter.dart';
import 'package:camba/Widgets/personalListTile.dart';
import 'package:flutter/material.dart';
import 'package:camba/Api/Models/categories.dart';

import '../Api/consultas.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late Categories categories;

  Map<String, dynamic> data = {};
  List<Widget> childrens = [];
  var servicios = [
    "Plomeria",
    "Cocina",
    "Profesores",
    "Herrería",
    "Abogados",
    "Construcción",
    "Carpintería",
    "Escribania",
    "Salud",
    "Jardineria"
  ];
  // List<Widget> servicios = [];
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
          backgroundColor: Color(0xff222222),
          title: Text(
            titulos[i].toString(),
            style: TextStyle(color: Colors.white),
          ),
          children: <Widget>[
            for (var ai = 0; ai < listr[i].length; ai++)
              PersonalListTile(
                // contentPadding: EdgeInsets.all(2),
                title: GestureDetector(
                  onTap: () {
                    var categoriaSeleccionada = listr[i][ai].toString();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CategoryFilter(categoriaSeleccionada);
                    }));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      listr[i][ai].toString() == '[]'
                          ? ''
                          : listr[i][ai].toString(),
                      style: TextStyle(color: Colors.white),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Categorías',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: llave == false
          ? Container()
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('TODAS LAS CATEGORIAS',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        Icon(
                          Icons.chevron_right_outlined,
                          color: Colors.white,
                        )
                      ],
                    ),
                    ExpansionTile(
                        backgroundColor: Colors.grey[600],
                        title: Text(
                          "PRODUCTOS",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        children: childrens),
                    ExpansionTile(
                      title: Text("SERVICIOS",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      children: <Widget>[
                        for (var i = 0; i < 10; i++)
                          ExpansionTile(
                            title: Text(servicios[i].toString(),
                                style: TextStyle(color: Colors.white)),
                            // children: <Widget>[
                            //   ListTile(
                            //     title: Text('data',
                            //         style: TextStyle(color: Colors.white)),
                            //   )
                            // ],
                          ),
                        // ListTile(
                        //   title: Text('data'),
                        // )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('OTROS',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        Icon(Icons.chevron_right_outlined)
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
