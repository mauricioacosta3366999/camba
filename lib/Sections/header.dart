import 'package:camba/Api/Models/cambasBuscados.dart';
import 'package:camba/Api/Models/obtenerCambas.dart';
import 'package:camba/Api/consultas.dart';
import 'package:camba/Home/categories.dart';
import 'package:camba/Login/login.dart';
import 'package:camba/Login/register.dart';
import 'package:camba/Pages/searchResult.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Header extends StatefulWidget {
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  var buscadorController = TextEditingController();
  CambasBuscados? cambasBuscados;
  CambasModel? cambas;

  @override
  void initState() {
    super.initState();
    inicializate();
  }

  void inicializate() async {
    var categoryFilter = "Todos";
    cambas = await Consultas().getCambas(0, categoryFilter);
  }

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return Column(
      children: [
        Container(
            color: Colors.yellow,
            child: Column(children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, top: 20),
                child: GestureDetector(
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (BuildContext context) {
                      //   return Home();
                      // }));
                    },
                    child: Image.asset(
                      'assets/images/camba-logo.png',
                      height: 80,
                      width: 250,
                    )),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 2.5),
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            controller: buscadorController,
                            textInputAction: TextInputAction.search,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Buscá tu camba',
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () async {
                          var searchText =
                              buscadorController.value.text.toString();
                          Consultas().searchCamba(searchText);
                          print(buscadorController.value.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchResult(searchText),
                            ),
                          );
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black)),
                          child: Icon(Icons.search),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ])),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) {
                return CategoriesPage();
              },
            ));
          },
          child: Container(
            height: 30,
            width: double.infinity,
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                Text(
                  'Ver Categorías',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  // void searchFunction() async {
  //   cambasBuscados = await Consultas().getSearchCambas();
  //   print(cambasBuscados);
  // }
}
