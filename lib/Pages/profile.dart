import 'dart:io';

import 'package:camba/Api/consultas.dart';
import 'package:camba/Pages/invitados.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State {
  final emailController = TextEditingController();
  var newNameController = TextEditingController();
  var newPhoneController = TextEditingController();
  String profileDefault = 'https://cambachivache.net/avatar/avatar.jpg';
  String userName = '';
  String userEmail = '';
  String userNickname = '';
  String userPhone = '';
  String userProfileApi = '';
  var edit = false;
  File? _image;
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _body(),
    );
  }

  @override
  void initState() {
    super.initState();
    inicializate();
  }

  inicializate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName')!;
      userEmail = prefs.getString('userEmail')!;
      userPhone = prefs.getString('userPhone')!;
      userNickname = prefs.getString('userNickname')!;
      userProfileApi = prefs.getString('userProfileApi')!;
    });
  }

  void profileUpdate(String newNombre, String newPhone) async {
    print('antes de entrar a la consulta : $newNombre y $newPhone');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var apiResponde = await Consultas().userUpdate(newNombre, newPhone);
    print('esta es la respuesta del update $apiResponde');
    setState(() {
      prefs.setString('userName', newNombre);
      prefs.setString('userPhone', newPhone);
      userName = newNombre;
      userPhone = newPhone;
    });
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (pickedFile != null) {
      var userProfile = pickedFile.path.toString();
      prefs.setString(userProfile, 'userProfile');
    }

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
        Stack(children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            height: 250,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  margin: EdgeInsets.only(top: 50),
                  height: 100,
                  width: 100,
                  child: _image == null
                      ? ClipRRect(
                          borderRadius: new BorderRadius.circular(100),
                          child: Image.network(
                            userProfileApi == ''
                                ? profileDefault
                                : userProfileApi,
                            fit: BoxFit.cover,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: new BorderRadius.circular(100),
                          child: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(userName == '' ? 'Cargando...' : userName,
                      style: TextStyle(fontSize: 20)),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            margin: EdgeInsets.only(top: 200, left: 40, right: 40),
            height: 90,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    getImage();
                  },
                  child: Container(
                      height: 30, width: 90, child: Text('EDITAR \nPERFIL')),
                ),
                VerticalDivider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        _image = null;
                      });
                    },
                    child: Container(
                        height: 30,
                        width: 90,
                        child: Text('ELIMINAR \nPERFIL')))
              ],
            ),
          )
        ]),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text('Nombre y Apellido'),
        ),
        edit == false
            ? Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.only(left: 20, right: 20),
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: Icon(Icons.person, color: Colors.grey),
                    ),
                    Text(
                      userName == '' ? 'Cargando...' : userName,
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ))
            : Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.only(left: 20, right: 20),
                padding: EdgeInsets.only(top: 3),
                height: 50,
                width: double.infinity,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.black,
                  controller: newNameController,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    hintText: 'Nombre y Apellido',
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text('Correo Electrónico'),
        ),
        Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.only(left: 20, right: 20),
            height: 50,
            width: double.infinity,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Icon(Icons.email, color: Colors.grey),
                ),
                Text(
                  userEmail == '' ? 'Cargando...' : userEmail,
                  style: TextStyle(fontSize: 16),
                )
              ],
            )),
//USUARIO
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text('Usuario'),
        ),
        Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.only(left: 20, right: 20),
            height: 50,
            width: double.infinity,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Icon(Icons.contacts_rounded, color: Colors.grey),
                ),
                Text(
                  userNickname == '' ? 'Cargando...' : userNickname,
                  style: TextStyle(fontSize: 16),
                )
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text('Teléfono'),
        ),
        edit == false
            ? Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.only(left: 20, right: 20),
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Icon(Icons.call, color: Colors.grey),
                    ),
                    Text(
                      userPhone == '' ? 'Cargando...' : userPhone,
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              )
            : Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.only(left: 20, right: 20),
                padding: EdgeInsets.only(top: 3),
                height: 50,
                width: double.infinity,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.black,
                  controller: newPhoneController,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.call,
                      color: Colors.grey,
                    ),
                    hintText: 'Número de teléfono',
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),
        edit == false
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    edit = true;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.only(left: 20, top: 20, right: 20),
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Editar perfil'),
                      Icon(
                        Icons.edit,
                        size: 20,
                      )
                    ],
                  ),
                ),
              )
            : Container(),
//CERRAR SESION
        edit == false
            ? GestureDetector(
                onTap: () {
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
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    ),
                                    backgroundColor: Colors.black54,
                                  ),
                                ),
                              ),
                              Form(
                                // key: _formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text('Quierés cerrar sesión?'),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    border: Border.all(
                                                        color: Colors.grey,
                                                        width: 2)),
                                                child: Text('CANCELAR',
                                                    style: TextStyle(
                                                        fontSize: 11)),
                                              ),
                                            )),
                                            SizedBox(width: 15),
                                            Expanded(
                                                child: GestureDetector(
                                                    onTap: () async {
                                                      print(
                                                          'Se cerró la sesión');
                                                      SharedPreferences prefs =
                                                          await SharedPreferences
                                                              .getInstance();
                                                      await prefs.clear();
                                                      Navigator.of(context)
                                                          .pushAndRemoveUntil(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          Invitados()),
                                                              (Route<dynamic>
                                                                      route) =>
                                                                  false);
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          border: Border.all(
                                                              color: Colors.red,
                                                              width: 2)),
                                                      child: Text('ACEPTAR',
                                                          style: TextStyle(
                                                              fontSize: 13)),
                                                    ))),
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(20)),
                  margin:
                      EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 50),
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Text('Cerrar sesión'), Icon(Icons.logout)],
                  ),
                ),
              )
            :
//CANCELAR
            GestureDetector(
                onTap: () {
                  setState(() {
                    edit = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(20)),
                  margin:
                      EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Cancelar'),
                      Icon(Icons.arrow_back_ios_sharp)
                    ],
                  ),
                ),
              ),
        edit == true
            ? GestureDetector(
                onTap: () {
                  if (newNameController.value.text.isNotEmpty &&
                      newPhoneController.value.text.isNotEmpty) {
                    setState(() {
                      edit = false;
                    });
                    var newName = newNameController.value.text;
                    var newPhone = newPhoneController.value.text;
                    profileUpdate(newName, newPhone);
                  } else {
                    final snackBar = SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Ambos campos son obligatorios *'),
                      action: SnackBarAction(
                        label: '',
                        onPressed: () {},
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(20)),
                  margin:
                      EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 50),
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Text('Guardar'), Icon(Icons.save)],
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
