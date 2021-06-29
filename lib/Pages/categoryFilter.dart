import 'package:camba/Api/Models/obtenerCambas.dart';
import 'package:camba/Api/consultas.dart';
import 'package:camba/Sections/header.dart';
import 'package:flutter/material.dart';

class CategoryFilter extends StatefulWidget {
  String categoriaSeleccionada;
  CategoryFilter(this.categoriaSeleccionada, {Key? key}) : super(key: key);
  @override
  _CategoryFilterState createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  var categoryProduct;
  var cambas;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  @override
  void initState() {
    super.initState();
    inicializate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void inicializate() async {
    var categoryFilter = widget.categoriaSeleccionada;
    cambas = await Consultas().getCambaByCategory(categoryFilter);
    setState(() {
      categoryProduct = cambas['message']['cambas']['original'];
      print('este es el log $categoryProduct');
    });
  }

  Widget _body() {
    return Column(
      children: [
        Header(),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            widget.categoriaSeleccionada,
            style: TextStyle(fontSize: 21),
          ),
        ),
        Divider(
          color: Colors.black,
          height: 20,
        ),
        SizedBox(
          height: 20,
        ),
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
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                width: double.infinity,
                child: Text(
                  "categoryProduct[0]['titulo_camba']",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                width: double.infinity,
                child: Text(
                  'datosCambas![i].descripcion.toString()',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // print(datosCambas![i]);
                  // var cambaName = datosCambas![i]
                  //     .tituloCamba
                  //     .toString();
                  // var cambaDescription = datosCambas![i]
                  //     .descripcion
                  //     .toString();
                  // var cambaImage = datosCambas![i]
                  //     .imagenes![0]
                  //     .pathImagen1280
                  //     .toString();
                  // var cambaImage2 = datosCambas![i]
                  //     .imagenes![0]
                  //     .pathImagen1920
                  //     .toString();
                  // var imageList = [];
                  // var categories = [];
                  // for (var j = 0;
                  //     j <
                  //         datosCambas![i]
                  //             .categorias!
                  //             .length;
                  //     j++) {
                  //   categories.add(datosCambas![i]
                  //       .categorias![j]
                  //       .nombreCategoria);
                  // }
                  // for (var j = 0;
                  //     j < datosCambas![i].imagenes!.length;
                  //     j++) {
                  //   imageList.add(datosCambas![i]
                  //       .imagenes![j]
                  //       .pathImagen1920);
                  //   print(
                  //       'este es la lista de la imagen $imageList');
                  // }
                  // var cambaPrice = datosCambas![i]
                  //     .precioEstimado
                  //     .toString();
                  // var cambaId = datosCambas![i].id;
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (BuildContext context) {
                  //       return ProductDetail(
                  //           cambaName,
                  //           cambaDescription,
                  //           cambaImage,
                  //           cambaPrice,
                  //           cambaId,
                  //           cambaImage2,
                  //           imageList,
                  //           categories);
                  //     },
                  //   ),
                  // );
                },
                child: Container(
                  alignment: Alignment.center,
                  margin:
                      EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
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
