import 'package:camba/Pages/cambaCreate.dart';
import 'package:camba/Sections/header.dart';
import 'package:flutter/material.dart';

class CambaCreado extends StatefulWidget {
  String titleCamba;
  String descriptionCamba;
  String priceCamba;
  List categoriasSeleccionadas;
  List cambaImages;
  CambaCreado(this.titleCamba, this.descriptionCamba, this.priceCamba,
      this.cambaImages, this.categoriasSeleccionadas,
      {Key? key})
      : super(key: key);

  @override
  CambaCreadoState createState() => CambaCreadoState();
}

class CambaCreadoState extends State<CambaCreado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: _body()),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Header(),
        Container(
          height: 300,
          width: double.infinity,
          color: Colors.grey,
          margin: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: widget.cambaImages[0].toString().contains('http')
              ? Image.network(widget.cambaImages[0])
              : Image.file(widget.cambaImages[0]),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            widget.titleCamba,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 30, top: 10),
          width: double.infinity,
          child: Text('Descripción: ',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 21,
              )),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 5, left: 55, right: 10),
          child: Text(
            widget.descriptionCamba,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 30, top: 10),
          width: double.infinity,
          child: Text('Precio Referencial:',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 21,
              )),
        ),
        Container(
          margin: EdgeInsets.only(left: 55, top: 10),
          width: double.infinity,
          child: Row(
            children: [
              Text(
                'Gs. ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.priceCamba.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 30, top: 10),
          width: double.infinity,
          child: Text('Categorías:',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 21,
              )),
        ),
        for (var i = 0; i < widget.categoriasSeleccionadas.length; i++)
          Container(
            margin: EdgeInsets.only(left: 50),
            child: Row(
              children: [
                Icon(Icons.check),
                Text(
                  widget.categoriasSeleccionadas[i].toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
          ),
        GestureDetector(
          onTap: () {
            var titleEdit = widget.titleCamba;
            var descriptionEdit = widget.descriptionCamba;
            var priceEdit1 = widget.priceCamba;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    cambaCreate(titleEdit, descriptionEdit, priceEdit1),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.only(left: 20, top: 20, right: 20),
            height: 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Editar',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {});
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.only(left: 20, top: 20, right: 20),
            height: 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Concretar',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {});
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.only(left: 20, top: 20, right: 20),
            height: 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Eliminar',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}
