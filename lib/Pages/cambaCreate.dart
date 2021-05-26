import 'package:flutter/material.dart';
import 'package:camba/Sections/header.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class cambaCreate extends StatefulWidget {
  cambaCreateState createState() => cambaCreateState();
}

class cambaCreateState extends State<cambaCreate> {
  File? _image;
  final picker = ImagePicker();
  final titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: _body(),
    ));
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
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
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
          margin: EdgeInsets.only(left: 10, top: 10, right: 10),
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
          child: TextField(
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
          child: _image == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/camera-icon.png',
                      height: 100,
                    ),
                    GestureDetector(
                      onTap: () {
                        getImage();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)),
                        margin: EdgeInsets.only(left: 60, top: 15, right: 60),
                        height: 40,
                        child: Text(
                          'Sube una Imagen',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    )
                  ],
                )
              : Image.file(_image!),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                margin:
                    EdgeInsets.only(left: 40, right: 40, bottom: 50, top: 20),
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.yellow),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    'Subir Camba',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                margin:
                    EdgeInsets.only(left: 40, right: 40, bottom: 50, top: 20),
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff444444)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
