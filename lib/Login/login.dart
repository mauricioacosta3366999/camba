import 'package:camba/Login/register.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State {
  final emailController = TextEditingController();
  final passController = TextEditingController();
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
                            padding: EdgeInsets.fromLTRB(30, 3, 0, 0),
                            margin: EdgeInsets.only(left: 10, right: 10),
                            height: 60,
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
                              controller: passController,
                              textInputAction: TextInputAction.search,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.lock_outlined,
                                  color: Colors.grey,
                                ),
                                hintText: 'Contraseña',
                                hintStyle: TextStyle(color: Colors.black),
                              ),
                              style: TextStyle(color: Colors.black),
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
                              onTap: () {
                                Navigator.pop(context);
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
