import 'package:camba/Api/consultas.dart';
import 'package:flutter/material.dart';
import 'package:camba/Api/Models/categories.dart';

import '../Api/Models/obtenerCambas.dart';
import '../Api/consultas.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late Categories categories;
  CambasModel? cambasModel;

  Map<String, dynamic> data = {};
  List<Widget> childrens = [];
  bool llave = false;

  loadJsonData() async {
    categories = await Consultas().getCategories();
    print(categories.productos);
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
      print(element);
    });

    childrens = <Widget>[
      for (var i = 0; i < titulos.length; i++)
        ExpansionTile(
          title: Text(titulos[i].toString()),
          children: <Widget>[
            for (var ai = 0; ai < listr[i].length; ai++)
              ListTile(
                title: Text(listr[i][ai].toString()),
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
    //_inicializate();
  }

  void _inicializate() async {
    categories = await Consultas().getCategories();
    cambasModel = await Consultas().getCambas();
    print(categories.productos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Categorías'),
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
                                fontSize: 18.0, fontWeight: FontWeight.bold)),
                        Icon(Icons.chevron_right_outlined)
                      ],
                    ),
                    ExpansionTile(
                        title: Text(
                          "PRODUCTOS",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        children: childrens),
                    ExpansionTile(
                      title: Text(
                        "SERVICIOS",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      children: <Widget>[
                        ExpansionTile(
                          title: Text(
                            'Sub title',
                          ),
                          children: <Widget>[
                            ListTile(
                              title: Text('data'),
                            )
                          ],
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
                                fontSize: 18.0, fontWeight: FontWeight.bold)),
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
