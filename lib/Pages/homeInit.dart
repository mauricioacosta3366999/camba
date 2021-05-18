import 'package:camba/Api/Models/obtenerCambas.dart';
import 'package:camba/Api/consultas.dart';
import 'package:camba/Pages/cambaCreate.dart';
import 'package:camba/Pages/productDetail.dart';
import 'package:camba/Sections/header.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeInit extends StatefulWidget {
  @override
  _HomeInitState createState() => _HomeInitState();
}

class _HomeInitState extends State {
  List<dynamic>? data;
  CambasModel? cambas;
  List datosCambas = [];
  bool cargado = false;
  @override
  void initState() {
    super.initState();
    _inicializate();
  }

  void _inicializate() async {
    var filter = 'Todos';
    cambas = await Consultas().getCambas();
    print(
        'estos son los datas del home ${cambas?.message?.cambas?.original?[0].descripcion}');
    setState(() {
      cargado = true;
    });
  }

  String slider1 = 'assets/images/slider/slider1.png';
  String slider2 = 'assets/images/slider/slider2.png';
  String slider3 = 'assets/images/slider/slider3.png';
  String slider4 = 'assets/images/slider/slider4.png';
  String slider5 = 'assets/images/slider/slider5.png';
  @override
  Widget build(BuildContext context) {
    return Container(
        child: cargado
            ? Column(
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Header(),
                        SizedBox(
                          height: 10,
                        ),
                        CarouselSlider(
                          options: CarouselOptions(height: 250.0),
                          items: [slider1, slider2, slider3, slider4, slider5]
                              .map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 9.0),
                                    decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        borderRadius: BorderRadius.circular(15),
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: Image.asset(i));
                              },
                            );
                          }).toList(),
                        ),
                        Padding(
                          padding: EdgeInsets.all(30),
                          child: Text(
                            'ULTIMOS CAMBAS SUBIDOS:',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Century Gothic'),
                          ),
                        ),
                        for (var i = 0; i < 9; i++)
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black)),
                            width: double.infinity,
                            margin: EdgeInsets.only(
                                left: 20, right: 20, bottom: 30),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return cambaCreate();
                                    }));
                                  },
                                  child: Container(
                                    color: Colors.grey[400],
                                    margin: EdgeInsets.all(20),
                                    height: 150,
                                    width: double.infinity,
                                    child: Image.network(cambas!
                                        .message!
                                        .cambas!
                                        .original![i]
                                        .imagenes![0]
                                        .pathImagen1920
                                        .toString()),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10),
                                  width: double.infinity,
                                  child: Text(
                                    cambas!.message!.cambas!.original![i]
                                        .tituloCamba
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 20),
                                  width: double.infinity,
                                  child: Text(
                                    cambas!.message!.cambas!.original![i]
                                        .descripcion
                                        .toString(),
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    var cambaName = cambas!.message!.cambas!
                                        .original![i].tituloCamba
                                        .toString();
                                    var cambaDescription = cambas!.message!
                                        .cambas!.original![i].descripcion
                                        .toString();
                                    var cambaImage = cambas!
                                        .message!
                                        .cambas!
                                        .original![i]
                                        .imagenes![0]
                                        .pathImagen1280
                                        .toString();
                                    var cambaPrice = cambas!.message!.cambas!
                                        .original![i].precioEstimado
                                        .toString();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return ProductDetail(
                                              cambaName,
                                              cambaDescription,
                                              cambaImage,
                                              cambaPrice);
                                        },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(
                                        left: 20,
                                        top: 20,
                                        right: 20,
                                        bottom: 20),
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
                    ),
                  )
                ],
              )
            : Container());
  }
}
