import 'package:camba/Home/home.dart';
import 'package:camba/Login/login.dart';
import 'package:camba/Pages/homeInit.dart';
import 'package:camba/Pages/sendProposal.dart';
import 'package:camba/Widgets/photo-viewer-widget.dart';
import 'package:flutter/material.dart';
import 'package:camba/Sections/header.dart';
import 'package:intl/intl.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductDetail extends StatefulWidget {
  var goLogin;
  var cambaId;
  var imageList;
  var categories;
  String cambaName;
  String cambaDescription;
  String cambaImage;
  String cambaImage2;
  String cambaPrice;
  ProductDetail(
      this.cambaName,
      this.cambaDescription,
      this.cambaImage,
      this.cambaPrice,
      this.cambaId,
      this.cambaImage2,
      this.imageList,
      this.categories,
      this.goLogin,
      {Key? key})
      : super(key: key);
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  var f = NumberFormat('#,###', 'es_AR');
  var categories6 = [
    'hola',
    'categorieas',
    'del',
    'dettalle',
    'mas',
    'por si las moscas'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: _details()),
    );
  }

  @override
  void initState() {
    super.initState();
    print(widget.categories);
  }

  Widget _details() {
    return Column(
      children: [
        Header(),
        // for (var i = 0; i < widget.imageList.length; i++)
        //   Container(
        //     color: Colors.grey[300],
        //     margin: EdgeInsets.all(20),
        //     height: 200,
        //     width: double.infinity,
        //     child: Image.network(widget.imageList[i], fit: BoxFit.cover),
        //   ),
        SizedBox(
          height: 20,
        ),
        widget.imageList.length > 1
            ? CarouselSlider(
                options: CarouselOptions(height: 250.0),
                items: widget.imageList.map<Widget>((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 9.0),
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black)),
                        child: ClipRRect(
                            borderRadius: new BorderRadius.circular(15),
                            child: PhotoViewerWidget(
                              url: i,
                              context: context,
                            )),
                      );
                    },
                  );
                }).toList(),
              )
            : Container(
                color: Colors.grey[300],
                margin: EdgeInsets.all(20),
                height: 200,
                width: double.infinity,
                child: PhotoViewerWidget(
                  url: widget.imageList[0],
                  context: context,
                )),
        SizedBox(
          height: 20,
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
          child: Row(
            children: [
              Text(
                'Gs.  ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(f.format(int.parse(widget.cambaPrice))),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, bottom: 5),
          alignment: Alignment.bottomLeft,
          child: Text(
            'Categorías:',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ),
        Wrap(
          children: [
            for (var i = 0; i < widget.categories.length; i++)
              Container(
                margin:
                    EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                child: Text(
                  widget.categories[i],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                widget.goLogin
                    ? Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                        return Login();
                      }))
                    : Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                        return sendProposal();
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
