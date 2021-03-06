import 'package:camba/Api/Models/cambasBuscados.dart';
import 'package:camba/Api/Models/obtenerCambas.dart';
import 'package:camba/Api/consultas.dart';
import 'package:camba/Home/categories.dart';
import 'package:camba/Login/login.dart';
import 'package:camba/Login/register.dart';
import 'package:camba/Pages/searchResult.dart';
import 'package:flutter/material.dart';

class HeaderInvite extends StatefulWidget {
  _HeaderInviteState createState() => _HeaderInviteState();
}

class _HeaderInviteState extends State<HeaderInvite> {
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
                margin: EdgeInsets.only(left: 20),
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
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 3),
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
                              hintText: 'Busc?? tu camba',
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(width: 7),
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
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Login();
                      }));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 10),
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      child: Text('INICIAR SESI??N'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Register();
                      }));
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      height: 40,
                      width: 150,
                      child: Text('REGISTRARSE'),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
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
                  'Ver Categor??as',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
