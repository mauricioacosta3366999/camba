import 'package:flutter/material.dart';
import 'package:camba/Sections/header.dart';

class cambaCreate extends StatefulWidget {
  cambaCreateState createState() => cambaCreateState();
}

class cambaCreateState extends State<cambaCreate> {
  final titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: _body(),
    ));
  }

  Widget _body() {
    return Column(
      children: [
        Header(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Creá tu camba',
            style: TextStyle(fontSize: 26),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(30, 3, 0, 0),
          margin: EdgeInsets.only(left: 10, right: 10),
          height: 60,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
          child: TextField(
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Colors.black,
            controller: titleController,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Título de tu camba',
              hintStyle: TextStyle(color: Colors.black),
            ),
            style: TextStyle(color: Colors.black),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
          color: Colors.yellow,
          height: 200,
          width: double.infinity,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(30, 3, 0, 0),
          margin: EdgeInsets.only(left: 10, right: 10),
          height: 150,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
          child: TextField(
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Colors.black,
            controller: titleController,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Descripción de tu camba',
              hintStyle: TextStyle(color: Colors.black),
            ),
            style: TextStyle(color: Colors.black),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(30, 3, 0, 0),
          margin: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
          height: 60,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
          child: TextField(
            keyboardType: TextInputType.number,
            cursorColor: Colors.black,
            controller: titleController,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Precio referencial en Gs',
              hintStyle: TextStyle(color: Colors.black),
            ),
            style: TextStyle(color: Colors.black),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
          child: ExpansionTile(
            title: Text(
              "Seleccionar categorias",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            children: <Widget>[
              ExpansionTile(
                title: Text(
                  'Sub title',
                ),
                children: <Widget>[
                  ListTile(
                    title: Text('data'),
                  )
                ],
              ),
              ListTile(
                title: Text('data'),
              )
            ],
          ),
        ),
        GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              margin:
                  EdgeInsets.only(left: 100, right: 100, bottom: 50, top: 20),
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff444444)),
              child: Text(
                'Subir Camba',
                style: TextStyle(color: Colors.white),
              ),
            )),
      ],
    );
  }
}
