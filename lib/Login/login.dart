import 'package:camba/Api/consultas.dart';
import 'package:camba/Home/home.dart';
import 'package:camba/Login/register.dart';
import 'package:camba/Pages/homeInit.dart';
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
                            padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
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
                                prefixIcon: Icon(
                                  Icons.email_outlined,
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
                            padding: EdgeInsets.only(left: 20, right: 10),
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
                                hintText: 'Añade una nueva contraseña',
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
                          SizedBox(height: 5),
                          Text(
                            'Olvidaste tu contraseña?  Click Aquí',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          GestureDetector(
                              onTap: () async {
                                var email =
                                    emailController.value.text.toString();
                                var pass = passController.value.text.toString();

                                var apiResponse =
                                    await Consultas().login(email, pass);

                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();

                                var userId = prefs.getInt('userId');

                                print(' este es el id del user $userId');

                                if (apiResponse['message'] == 'Unauthorized' ||
                                    passController.value.text.isEmpty ||
                                    emailController.value.text.isEmpty) {
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
                                  print(' en teoria autorizado');
                                  print(apiResponse);
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Home();
                                  }));
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
                        ],
                      ),
                    ),
                  )))
        ],
      ),
    );
  }
}
