import 'package:camba/Pages/homeInit.dart';
import 'package:camba/Pages/profile.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final nickNameController = TextEditingController();
  final phoneController = TextEditingController();
  final passController = TextEditingController();

  var permiso = true;

  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/bg_white.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Image.asset('assets/images/camba-logo.png'),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 15),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(30, 3, 0, 0),
                              margin: EdgeInsets.only(left: 10, right: 10),
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextField(
                                cursorColor: Colors.black,
                                controller: nameController,
                                textInputAction: TextInputAction.search,
                                decoration: InputDecoration(
                                  errorText: _validate
                                      ? 'Value Can\'t Be Empty'
                                      : null,
                                  border: InputBorder.none,
                                  hintText: 'Nombre y Apellido',
                                  prefixIcon: Icon(
                                      Icons.person_outline_outlined,
                                      color: Colors.grey),
                                  hintStyle: TextStyle(color: Colors.black),
                                ),
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(30, 3, 0, 0),
                              margin:
                                  EdgeInsets.only(left: 10, top: 20, right: 10),
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: Colors.black,
                                controller: emailController,
                                textInputAction: TextInputAction.search,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.email_outlined,
                                      color: Colors.grey),
                                  hintText: 'Correo Electrónico',
                                  hintStyle: TextStyle(color: Colors.black),
                                ),
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(30, 3, 0, 0),
                              margin:
                                  EdgeInsets.only(left: 10, top: 20, right: 10),
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextField(
                                cursorColor: Colors.black,
                                controller: nickNameController,
                                textInputAction: TextInputAction.search,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Nombre de Usuario',
                                  prefixIcon: Icon(
                                      Icons.chrome_reader_mode_outlined,
                                      color: Colors.grey),
                                  hintStyle: TextStyle(color: Colors.black),
                                ),
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(30, 3, 0, 0),
                              margin:
                                  EdgeInsets.only(left: 10, top: 20, right: 10),
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextField(
                                cursorColor: Colors.black,
                                controller: phoneController,
                                textInputAction: TextInputAction.search,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.phone_enabled_outlined,
                                      color: Colors.grey),
                                  hintText: 'Número de teléfono',
                                  hintStyle: TextStyle(color: Colors.black),
                                ),
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                              margin:
                                  EdgeInsets.only(left: 10, top: 20, right: 10),
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextField(
                                cursorColor: Colors.black,
                                controller: passController,
                                textInputAction: TextInputAction.search,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Contraseña',
                                  prefixIcon: Icon(Icons.lock_outlined,
                                      color: Colors.grey),
                                  hintStyle: TextStyle(color: Colors.black),
                                ),
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            permiso == false
                                ? Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                        'Completa correctamente todos los campos*',
                                        style: TextStyle(color: Colors.red)),
                                  )
                                : Container(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  emailController.text.isNotEmpty &&
                                          nameController.text.isNotEmpty &&
                                          passController.text.isNotEmpty &&
                                          nickNameController.text.isNotEmpty &&
                                          phoneController.text.isNotEmpty
                                      ? _validate = true
                                      : _validate = false;
                                });
                                bool emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(emailController.text);
                                if (emailValid && _validate) {
                                  Navigator.pop(context);
                                  setState(() {
                                    permiso = true;
                                  });
                                } else {
                                  setState(() {
                                    permiso = false;
                                  });
                                  print('no permitido');
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(
                                    left: 10, bottom: 50, top: 25),
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xff444444)),
                                child: Text(
                                  'REGISTRARME',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
