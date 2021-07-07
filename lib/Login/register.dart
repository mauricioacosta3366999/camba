import 'package:camba/Api/consultas.dart';
import 'package:camba/Home/home.dart';
import 'package:camba/Pages/homeInit.dart';
import 'package:camba/Pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  bool _passwordVisible = false;

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
                              padding: EdgeInsets.fromLTRB(30, 3, 20, 0),
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
                                  border: InputBorder.none,
                                  hintText: 'Nombre y Apellido',
                                  suffixIcon: Icon(
                                      Icons.person_outline_outlined,
                                      color: Colors.grey),
                                  hintStyle: TextStyle(color: Colors.black),
                                ),
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(30, 3, 20, 0),
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
                                  suffixIcon: Icon(Icons.email_outlined,
                                      color: Colors.grey),
                                  hintText: 'Correo Electrónico',
                                  hintStyle: TextStyle(color: Colors.black),
                                ),
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(30, 3, 20, 0),
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
                                  suffixIcon: Icon(
                                      Icons.chrome_reader_mode_outlined,
                                      color: Colors.grey),
                                  hintStyle: TextStyle(color: Colors.black),
                                ),
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(30, 3, 20, 0),
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
                                  suffixIcon: Icon(Icons.phone_enabled_outlined,
                                      color: Colors.grey),
                                  hintText: 'Número de teléfono',
                                  hintStyle: TextStyle(color: Colors.black),
                                ),
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 20, right: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              margin:
                                  EdgeInsets.only(left: 10, top: 20, right: 10),
                              height: 50,
                              width: double.infinity,
                              child: TextField(
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.text,
                                controller: passController,
                                obscureText:
                                    !_passwordVisible, //This will obscure text dynamically
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Contraseña',
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                var nombre =
                                    nameController.value.text.toString();
                                var email =
                                    emailController.value.text.toString();
                                var telefono =
                                    phoneController.value.text.toString();
                                var userName =
                                    nickNameController.value.text.toString();
                                var pass = passController.value.text.toString();
                                var imagen = '';
                                var apiResponse = await Consultas().register(
                                  nombre,
                                  email,
                                  telefono,
                                  userName,
                                  pass,
                                  imagen,
                                );

                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setString('userName', nombre);
                                prefs.setString('userPhone', telefono);
                                prefs.setString('userNickname', userName);
                                prefs.setString('userEmail', email);
                                prefs.setString('userProfileApi', imagen);

                                print(apiResponse);
                                setState(() {
                                  emailController.text.isNotEmpty &&
                                          nameController.text.isNotEmpty &&
                                          passController.text.isNotEmpty &&
                                          passController.value.text.characters
                                                  .length >=
                                              6 &&
                                          nickNameController.text.isNotEmpty &&
                                          phoneController.text.isNotEmpty
                                      ? _validate = true
                                      : _validate = false;
                                });
                                bool emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(emailController.text);
                                if (emailValid &&
                                    apiResponse['message'] ==
                                        "Usuario creado exitosamente") {
                                  print(emailController.value.text);
                                  print('permiso concedido');
                                  permiso = true;
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Home();
                                  }));
                                } else {
                                  permiso = false;
                                  final snackBar = SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(
                                        'Completa todos los campos correctamente *'),
                                    action: SnackBarAction(
                                      label: '',
                                      onPressed: () {},
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 50, top: 25),
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
