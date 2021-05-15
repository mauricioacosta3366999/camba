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
  String slider1 = 'assets/images/slider/slider1.png';
  String slider2 = 'assets/images/slider/slider2.png';
  String slider3 = 'assets/images/slider/slider3.png';
  String slider4 = 'assets/images/slider/slider4.png';
  String slider5 = 'assets/images/slider/slider5.png';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
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
                  items: [slider1, slider2, slider3, slider4, slider5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 9.0),
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.black)),
                            child: Image.asset(i));
                      },
                    );
                  }).toList(),
                ),
                Padding(
                    padding: EdgeInsets.all(30),
                    child: Text('ULTIMOS CAMBAS SUBIDOS:',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Century Gothic'))),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black)),
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
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
                          color: Colors.lightBlue,
                          margin: EdgeInsets.all(20),
                          height: 100,
                          width: double.infinity,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin:
                            EdgeInsets.only(left: 20, right: 20, bottom: 10),
                        width: double.infinity,
                        child: Text(
                          'El Nombre del Producto.',
                          style: TextStyle(fontSize: 21),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        width: double.infinity,
                        child: Text(
                            'Esta es la Descripción del producto. Esto prueba el largor y como se ve el comentario largo de la gente'),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return ProductDetail();
                            }));
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
                          )),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
