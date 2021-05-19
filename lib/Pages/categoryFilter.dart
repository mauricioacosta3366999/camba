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
  CambasModel? cambas;
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

  void inicializate() async {
    var categoryFilter = widget.categoriaSeleccionada;
    cambas = await Consultas().getCambas();
    print(cambas!.message!.cambas!.original!.length);
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
        )
      ],
    );
  }
}
