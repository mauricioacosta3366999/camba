import 'package:camba/Login/login.dart';
import 'package:camba/Sections/header.dart';
import 'package:flutter/material.dart';

class passRecover extends StatefulWidget {
  const passRecover({Key? key}) : super(key: key);

  @override
  _passRecoverState createState() => _passRecoverState();
}

class _passRecoverState extends State<passRecover> {
  final recuperateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Stack(
      children: [
        Image.asset(
          'assets/images/bg_yellow.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        SafeArea(
          child: SizedBox(
            child: Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset('assets/images/camba-logo.png'),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    "Restablecimiento de contraseña:",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      "¿Has olvidado tu contraseña? Ingresá tu correo electrónico y te enviaremos un correo que te permitirá restablecerla.",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(30, 5, 10, 10),
                    margin: EdgeInsets.only(left: 10, right: 10),
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                      controller: recuperateController,
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
                  GestureDetector(
                    onTap: () {
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(recuperateController.text);
                      if (emailValid) {
                        final snackBar = SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('El correo fue enviado exitosamente'),
                          action: SnackBarAction(
                            label: '',
                            onPressed: () {},
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      } else {
                        final snackBar = SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Ingrese un correo electrónico válido'),
                          action: SnackBarAction(
                            label: '',
                            onPressed: () {},
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff444444)),
                      child: Text(
                        'REESTABLECER MI CONTRASENA',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
