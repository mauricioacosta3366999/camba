import 'package:camba/Home/home.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Stack(children: [
          Container(
            padding: EdgeInsets.only(top: 10),
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
                  height: 90,
                  width: 90,
                  child: Icon(
                    Icons.person,
                    size: 70,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 150, left: 30, right: 30),
            width: 350,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(height: 30, width: 90, child: Text('CAMBIAR FOTO')),
                VerticalDivider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                Container(height: 30, width: 90, child: Text('ELIMINAR FOTO'))
              ],
            ),
          )
        ]),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text('Nombre y Apellido'),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20)),
          margin: EdgeInsets.only(left: 20, right: 20),
          height: 50,
          width: double.infinity,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            cursorColor: Colors.black,
            controller: emailController,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.person,
                color: Colors.grey,
              ),
              hintText: 'Nombre Completo',
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
                  'mauricio.acosta@gmail.com',
                  style: TextStyle(fontSize: 16),
                )
              ],
            )),
//IR A CAMBACHIVAVHEAR (HOME)
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
                  'Macosta',
                  style: TextStyle(fontSize: 16),
                )
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text('Cambiar contraseña'),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20)),
          margin: EdgeInsets.only(left: 20, bottom: 20, right: 20),
          height: 50,
          width: double.infinity,
          child: TextField(
            cursorColor: Colors.black,
            keyboardType: TextInputType.text,
            controller: passController,
            obscureText: !_passwordVisible, //This will obscure text dynamically
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Añade una nueva contraseña',
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20)),
                height: 50,
                width: 150,
                child: Text('CANCELAR'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Home();
                }));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(20)),
                alignment: Alignment.center,
                height: 50,
                width: 150,
                child: Text('GUARDAR'),
              ),
            )
          ],
        )
      ],
    );
  }
}
