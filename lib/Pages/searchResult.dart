import 'package:camba/Api/consultas.dart';
import 'package:camba/Home/home.dart';
import 'package:camba/Pages/homeInit.dart';
import 'package:camba/Pages/productDetail.dart';
import 'package:camba/Sections/header.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatefulWidget {
  String searchText;
  SearchResult(this.searchText, {Key? key}) : super(key: key);

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  var listaBuscados = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Header(),
          _body(),
        ],
      )),
    );
  }

  @override
  void initState() {
    super.initState();
    _inicializate();
  }

  void _inicializate() async {
    var searchText = widget.searchText;
    final result = await Consultas().searchCamba(searchText);
    print('esto es searchResultssss $result');
    setState(() {
      listaBuscados = result['cambas']['original'];
    });
  }

  Widget _body() {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 25, left: 20, bottom: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Resultados para:  ',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    widget.searchText,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  margin:
                      EdgeInsets.only(left: 0, top: 20, right: 20, bottom: 20),
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.yellow),
                  child: Text('Volver al inicio'),
                ),
              ),
            ],
          ),
        ),
        for (var i = 0; i < listaBuscados.length; i++)
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey)),
            width: double.infinity,
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
            child: Column(
              children: [
                Container(
                    color: Colors.grey[400],
                    margin: EdgeInsets.all(20),
                    height: 150,
                    width: double.infinity,
                    child: listaBuscados[i]['imagenes'].isEmpty
                        ? Image.asset(
                            'assets/images/cambasinfoto.jpg',
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            listaBuscados[i]['imagenes'][0]['path_imagen_1920']
                                .toString(),
                            fit: BoxFit.cover,
                          )),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  width: double.infinity,
                  child: Text(
                    listaBuscados[i]["titulo_camba"].toString(),
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  width: double.infinity,
                  child: Text(
                    listaBuscados[i]["descripcion"].toString(),
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    var cambaName = listaBuscados[i]["titulo_camba"].toString();
                    var cambaDescription =
                        listaBuscados[i]["descripcion"].toString();
                    var cambaImage = listaBuscados[i]['imagenes'][0]
                            ['path_imagen_1920']
                        .toString();
                    var cambaImage2 = listaBuscados[i]['imagenes'][0]
                            ['path_imagen_1280']
                        .toString();
                    var cambaPrice =
                        listaBuscados[i]["precio_estimado"].toString();
                    var cambaId = listaBuscados[i]["id"];
                    var imageList = [];
                    var categories = [];
                    var recorrida = listaBuscados[i]["imagenes"].length;
                    var recorrida2 = listaBuscados[i]["categorias"].length;
                    for (var j = 0; j < recorrida2; j++) {
                      categories.add(listaBuscados[i]["categorias"][j]
                          ["nombre_categoria"]);
                    }
                    for (var j = 0; j < recorrida; j++) {
                      imageList.add(
                          listaBuscados[i]["imagenes"][j]["path_imagen_1920"]);
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ProductDetail(
                              cambaName,
                              cambaDescription,
                              cambaImage,
                              cambaPrice,
                              cambaId,
                              cambaImage2,
                              imageList,
                              categories);
                        },
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        left: 20, top: 20, right: 20, bottom: 20),
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff444444)),
                    child: Text(
                      'VER CAMBA',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )
      ],
    );
  }
}
