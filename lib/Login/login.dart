import 'package:camba/Api/consultas.dart';
import 'package:camba/Home/home.dart';
import 'package:camba/Login/passRecover.dart';
import 'package:camba/Login/register.dart';
import 'package:camba/Pages/homeInit.dart';
import 'package:camba/Pages/invitados.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

// import 'dart:html';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool _passwordVisible = false;
  @override
  @override
  void initState() {
    super.initState();
    session(context);
  }

  void session(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getInt('userid');

    print('este es el login $userId');

    if (userId != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeInit()));
    } else {
      print('nunca inició sesión');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/bg_yellow.jpg',
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
                            height: 50,
                          ),
                          Image.asset('assets/images/camba-logo.png'),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.fromLTRB(30, 3, 20, 0),
                            margin: EdgeInsets.only(left: 10, right: 10),
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
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.email_outlined),
                                  color: Colors.grey,
                                ),
                                hintText: 'Correo Electrónico',
                                hintStyle: TextStyle(color: Colors.black),
                              ),
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.fromLTRB(30, 3, 16, 0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            margin: EdgeInsets.only(left: 10, right: 10),
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
                                  alignment: Alignment.centerLeft,
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
                          SizedBox(height: 5),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => passRecover()));
                            },
                            child: Text(
                              'Olvidaste tu contraseña?  Click Aquí',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          GestureDetector(
                              onTap: () async {
                                var email =
                                    emailController.value.text.toString();
                                var pass = passController.value.text.toString();

                                if (passController.value.text.isNotEmpty ||
                                    emailController.value.text.isNotEmpty) {
                                  var apiResponse =
                                      await Consultas().login(email, pass);
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();

                                  var userId = prefs.getInt('userId');

                                  if (apiResponse['message'] ==
                                      'Unauthorized') {
                                    final snackBar = SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text('Credenciales incorrectos'),
                                      action: SnackBarAction(
                                        label: '',
                                        onPressed: () {},
                                      ),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    print(apiResponse);
                                  } else {
                                    print(apiResponse);
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Home();
                                    }));
                                  }
                                  print(' este es el id del user $userId');
                                } else {
                                  final snackBar = SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text('Completa todos los campos'),
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
                                margin: EdgeInsets.only(left: 10, top: 20),
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xff444444)),
                                child: Text(
                                  'INGRESAR',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                          SizedBox(height: 50),
                          Text(
                            'Sos nuevo?',
                            style: TextStyle(fontSize: 18),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return Register();
                              }));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: 10, top: 5),
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff444444)),
                              child: Text(
                                'REGISTRATE',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Text(
                            'ó',
                            style: TextStyle(fontSize: 18),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return Invitados();
                              }));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: 10, top: 5),
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff444444)),
                              child: Text(
                                'INGRESAR COMO INVITADO',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )))
        ],
      ),
    );
  }
}
