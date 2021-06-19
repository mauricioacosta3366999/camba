import 'package:camba/Api/consultas.dart';
import 'package:camba/Pages/cambaCreado.dart';
import 'package:camba/Sections/header.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'package:shared_preferences/shared_preferences.dart';

class MisPropuestas extends StatefulWidget {
  _MisPropuestasState createState() => _MisPropuestasState();
}

class _MisPropuestasState extends State<MisPropuestas> {
  Consultas consultas = new Consultas();
  var loader = true;
  List misPropuestas = [];

  void propuestas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getInt('userId')!;
    print(userId);
    final result = await consultas.propuestasRecibidas();
    developer.log("Propuestas result" + result.toString());
    loader = false;
    setState(() {
      misPropuestas = result;
      loader = false;
    });
  }

  @override
  void initState() {
    super.initState();
    propuestas();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_body()],
    );
  }

  Widget _body() {
    print('misprpuestas $misPropuestas');
    return loader == true
        ? Column(
            children: [
              Header(),
              SizedBox(
                height: 100,
              ),
              CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow)),
            ],
          )
        : Column(
            children: [
              Header(),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'MIS PROPUESTAS',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Divider(
                color: Colors.grey,
                height: 15,
                thickness: 1,
              ),
              misPropuestas == []
                  ? Text(
                      'Sin datos',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    )
                  : Text('Sin Propuestas'),
              for (var i = 0; i < misPropuestas.length; i++)
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                            color: Colors.grey[400],
                            margin: EdgeInsets.all(20),
                            height: 150,
                            width: double.infinity,
                            child: Image.network(misPropuestas[i]['imagenes'][0]
                                ['path_imagen_1920'])),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin:
                            EdgeInsets.only(left: 20, right: 20, bottom: 10),
                        width: double.infinity,
                        child: Text(
                          misPropuestas[0]['titulo_camba'].toString(),
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        width: double.infinity,
                        child: Text(
                          misPropuestas[0]['descripcion'].toString(),
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      GestureDetector(
//EL ERROR OCURRE PORQUE ESPERA UNA TIPO DE IMAGEN DISTINTA A LA QUE RECIBE

                        onTap: () {
                          var titleCamba = misPropuestas[0]['titulo_camba'];
                          var descriptionCamba =
                              misPropuestas[0]['descripcion'];
                          var priceCamba = misPropuestas[0]['precio_estimado'];
                          List cambaImages = [];
                          var categoriasSeleccionadas = [];
                          var cambaImage = misPropuestas[0]['imagenes'][0]
                                  ['path_imagen_1920']
                              .toString();
                          cambaImages.add(cambaImage);
                          print(
                              'esto es el array de imagenes que busco $cambaImages');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CambaCreado(
                                    titleCamba,
                                    descriptionCamba,
                                    priceCamba,
                                    cambaImages,
                                    categoriasSeleccionadas)),
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
                ),
            ],
          );
  }
}
