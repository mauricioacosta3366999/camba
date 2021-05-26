import 'package:camba/Pages/homeInit.dart';
import 'package:flutter/material.dart';
import 'package:camba/Sections/header.dart';
import 'package:photo_view/photo_view.dart';

class ProductDetail extends StatefulWidget {
  String cambaName;
  String cambaDescription;
  String cambaImage;
  String cambaPrice;
  ProductDetail(
      this.cambaName, this.cambaDescription, this.cambaImage, this.cambaPrice,
      {Key? key})
      : super(key: key);
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: _details()),
    );
  }

  Widget _details() {
    return Column(
      children: [
        Header(),
        Container(
          color: Colors.grey[300],
          margin: EdgeInsets.all(20),
          height: 200,
          width: double.infinity,
          child: Image.network(widget.cambaImage),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
          width: double.infinity,
          child: Text(
            widget.cambaName,
            style: TextStyle(fontSize: 21),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, bottom: 5),
          alignment: Alignment.bottomLeft,
          child: Text(
            'Descripción:',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          width: double.infinity,
          child: Text(widget.cambaDescription),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, bottom: 5),
          alignment: Alignment.bottomLeft,
          child: Text(
            'Precio Referencial:',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          width: double.infinity,
          child: Text(widget.cambaPrice),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, bottom: 5),
          alignment: Alignment.bottomLeft,
          child: Text(
            'Categorías:',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          width: double.infinity,
          child: Text('Ropa y Bebe'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return HomeInit();
                }));
              },
              child: Container(
                alignment: Alignment.center,
                margin:
                    EdgeInsets.only(left: 0, top: 20, right: 20, bottom: 20),
                height: 35,
                width: 190,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.yellow),
                child: Text('Me interesa este camba'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 20),
                height: 35,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xff444444)),
                child: Text(
                  'Volver',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
