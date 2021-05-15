import 'package:camba/Home/home.dart';
import 'package:camba/Login/editProfile.dart';
import 'package:camba/Pages/misCambas.dart';
import 'package:camba/Pages/misPropuestas.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State {
  @override
  Widget build(BuildContext context) {
    return _body();
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
            height: 200,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  margin: EdgeInsets.only(top: 30),
                  height: 80,
                  width: 80,
                  child: Icon(
                    Icons.person,
                    size: 70,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Nombre de Perfil'),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            margin: EdgeInsets.only(top: 150, left: 30, right: 30),
            width: 350,
            height: 100,
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MisCambas();
                    }));
                  },
                  child: Container(
                      height: 30, width: 90, child: Text('MIS \nCAMBAS')),
                ),
                VerticalDivider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MisPropuestas();
                      }));
                    },
                    child: Container(
                        height: 30, width: 90, child: Text('MIS \nPROPUESTAS')))
              ],
            ),
          )
        ]),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20)),
          margin: EdgeInsets.only(left: 20, top: 20, right: 20),
          height: 50,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text('Ver mensajes'), Icon(Icons.chat)],
          ),
        ),
//EDITAR PERFIL
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return EditProfile();
            }));
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
        ),
//IR A CAMBACHIVAVHEAR (HOME)
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Home();
            }));
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
                Text('Ir a cambachivachear'),
                Icon(
                  Icons.arrow_right_outlined,
                  size: 40,
                )
              ],
            ),
          ),
        ),
//CERRAR SESION
        GestureDetector(
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
                                                  BorderRadius.circular(30),
                                              border: Border.all(
                                                  color: Colors.grey,
                                                  width: 2)),
                                          child: Text('CANCELAR',
                                              style: TextStyle(fontSize: 11)),
                                        ),
                                      )),
                                      SizedBox(width: 15),
                                      Expanded(
                                          child: GestureDetector(
                                              onTap: () {
                                                print('Se cerró la sesión');
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                  return Home();
                                                }));
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
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
            margin: EdgeInsets.only(left: 20, top: 20, right: 20),
            height: 50,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text('Cerrar sesión'), Icon(Icons.logout)],
            ),
          ),
        )
      ],
    );
  }
}
