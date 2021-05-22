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
  List<Original>? datosCambas = [];
  ScrollController? _scrollController;
  bool cargado = false;
  int page = 0;
  bool saltar = true;
  @override
  void initState() {
    super.initState();
    _inicializate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _inicializate() async {
    var categoryFilter = 'Todos';
    cambas = await Consultas().getCambas(0);
    print(cambas!.message!.cambas!.original!.length);
    datosCambas = cambas!.message!.cambas!.original!;
    print(
        'estos son los datas del home ${cambas?.message?.cambas?.original?[0].descripcion}');
    setState(() {
      page = cambas!.message!.last!;
      cargado = true;
    });
  }

  fun() async {
    print('ENTRO DENTRO DEL SRCROLL');
    if (_scrollController!.offset >=
            _scrollController!.position.maxScrollExtent &&
        !_scrollController!.position.outOfRange) {

          if (saltar == true) {
            setState(() {
              saltar = false;
            });
          } else {

            print('ENTRO DENTRO DEL SRCROLL2');
            CambasModel cambas2 = await Consultas().getCambas(page);
            cambas2.message!.cambas!.original!.forEach((element) {
              print("2 ${element.tituloCamba}");
            });
            for (var item in cambas2.message!.cambas!.original!) {
              datosCambas!.add(item);
            }
            datosCambas?.forEach((element) {
              print("1  ${element.tituloCamba}");
            });

            print(datosCambas!.length);
            print(cambas2.message!.cambas!.original!.length);
            setState(() {
              page = cambas2.message!.last!;
              datosCambas;
            });

          }
      
    }
  }

  String slider1 = 'assets/images/slider/slider1.png';
  String slider2 = 'assets/images/slider/slider2.png';
  String slider3 = 'assets/images/slider/slider3.png';
  String slider4 = 'assets/images/slider/slider4.png';
  String slider5 = 'assets/images/slider/slider5.png';
  @override
  Widget build(BuildContext context) {
    _scrollController = new ScrollController(initialScrollOffset: 5.0)
      ..addListener(fun);
    return SingleChildScrollView(
      controller: _scrollController,
      child: Container(
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
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                          for (var i = 0; i < datosCambas!.length; i++)
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
                                      child: Image.network(datosCambas![i]
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
                                      datosCambas![i].tituloCamba.toString(),
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
                                      datosCambas![i].descripcion.toString(),
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      var cambaName = datosCambas![i]
                                          .tituloCamba
                                          .toString();
                                      var cambaDescription = datosCambas![i]
                                          .descripcion
                                          .toString();
                                      var cambaImage = datosCambas![i]
                                          .imagenes![0]
                                          .pathImagen1280
                                          .toString();
                                      var cambaPrice = datosCambas![i]
                                          .precioEstimado
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
              : Container()),
    );
  }
}
