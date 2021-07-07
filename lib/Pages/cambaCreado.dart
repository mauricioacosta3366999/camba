import 'package:camba/Api/consultas.dart';
import 'package:camba/Pages/cambaCreate.dart';
import 'package:camba/Sections/header.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CambaCreado extends StatefulWidget {
  String propuesta;
  var cambaId;
  String titleCamba;
  String descriptionCamba;
  String priceCamba;
  List categoriasSeleccionadas;
  List cambaImages;
  var aceptarPropuesta;
  CambaCreado(
      this.titleCamba,
      this.descriptionCamba,
      this.priceCamba,
      this.cambaImages,
      this.categoriasSeleccionadas,
      this.cambaId,
      this.propuesta,
      {Key? key})
      : super(key: key);

  @override
  CambaCreadoState createState() => CambaCreadoState();
}

class CambaCreadoState extends State<CambaCreado> {
  var f = NumberFormat('#,###', 'es_AR');
  final _formKey = GlobalKey<FormState>();
  List propuestas = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: _body()),
    );
  }

  @override
  void initState() {
    super.initState();
    peticion();
  }

  void peticion() async {
    var cambaId = widget.cambaId.toString();
    var apiResponse = await Consultas().getCamba(cambaId);
    setState(() {
      propuestas =
          apiResponse["message"]["resultado"]["original"]["propuestas"];
      // for (var i = 0; i < propuestas.length; i++) {
      //   print('esta es la imagen numero $i');
      //   print(propuestas[i]["imagenes"]);
      // }
    });
  }

  void aceptarPropuesta(String mensaje) async {
    var propuestaId = widget.cambaId.toString();
    var respuesta = await Consultas().aceptarPropuesta(propuestaId, mensaje);
    print('esta es la respuesta de aceptar $respuesta');
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
              ? Image.network(
                  widget.cambaImages[0],
                  fit: BoxFit.cover,
                )
              : Image.file(
                  widget.cambaImages[0],
                  fit: BoxFit.cover,
                ),
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
                widget.priceCamba,
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
        Row(
          children: [
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
                width: 155,
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
                width: 155,
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
          ],
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
        widget.propuesta == 'si'
            ? Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Propuestas Recibidas :',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                    for (var i = 0; i < propuestas.length; i++)
                      Wrap(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey)),
                            width: double.infinity,
                            margin: EdgeInsets.only(
                                left: 20, right: 20, bottom: 30),
                            child: Column(
                              children: [
                                Container(
                                    color: Colors.grey[400],
                                    margin: EdgeInsets.all(20),
                                    height: 150,
                                    width: double.infinity,
                                    child: propuestas[i]['imagenes'].isEmpty
                                        ? Image.asset(
                                            'assets/images/cambasinfoto.jpg',
                                            fit: BoxFit.cover,
                                          )
                                        : Image.network(
                                            propuestas[i]['imagenes'][0]
                                                    ['path_imagen_1920']
                                                .toString(),
                                            fit: BoxFit.cover,
                                          )),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10),
                                  width: double.infinity,
                                  child: Text(
                                    'Propuesta recibida de: ' +
                                        propuestas[i]["usuario"]["name"],
                                    style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    var nombre =
                                        propuestas[i]["usuario"]["user_name"];
                                    var mensaje = propuestas[i]["descripción"];
                                    String imagen =
                                        propuestas[i]["imagenes"].isEmpty
                                            ? ''
                                            : propuestas[i]["imagenes"][0]
                                                ["path_imagen_1920"];
                                    show(nombre, mensaje, imagen);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(
                                        left: 20,
                                        top: 10,
                                        right: 20,
                                        bottom: 20),
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xff444444)),
                                    child: Text(
                                      'VER PROPUESTA',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                  ],
                ),
              )
            : Container(),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }

  void show(nombre, mensaje, imagen) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                  right: -40.0,
                  top: -40.0,
                  child: InkResponse(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      child: Icon(Icons.close),
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                              height: 180,
                              width: 150,
                              color: Colors.grey,
                              child: imagen == ''
                                  ? Image.asset(
                                      'assets/images/cambasinfoto.jpg',
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(imagen, fit: BoxFit.cover)),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20, bottom: 5),
                                child: ClipRRect(
                                  borderRadius: new BorderRadius.circular(100),
                                  child: Image.network(
                                    "https://cambachivache.net:9000//avatar/avatar.jpg",
                                    height: 70,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(nombre),
                              GestureDetector(
                                onTap: () {
                                  var mensaje = "Aceptada";
                                  aceptarPropuesta(mensaje);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.green),
                                      borderRadius: BorderRadius.circular(20)),
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                      left: 10, bottom: 5, top: 5),
                                  height: 40,
                                  width: 100,
                                  child: Text('Aceptar'),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  var mensaje = "Rechazada";
                                  aceptarPropuesta(mensaje);
                                  Navigator.pop(context);
                                  final snackBar = SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text('Se rechazó la propuesta'),
                                    action: SnackBarAction(
                                      label: '',
                                      onPressed: () {},
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.red),
                                      borderRadius: BorderRadius.circular(20)),
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: 10, top: 5),
                                  height: 40,
                                  width: 100,
                                  child: Text('Rechazar'),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 5),
                            child: Text(mensaje == null
                                ? " Mensaje: No dejó ningun mensaje aqui en el lugar del mensaje "
                                : "Mensaje: $mensaje"),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
