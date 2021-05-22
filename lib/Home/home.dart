import 'package:camba/Pages/cambaCreate.dart';
import 'package:camba/Pages/chat.dart';
import 'package:camba/Pages/homeInit.dart';
import 'package:camba/Pages/misCambas.dart';
import 'package:camba/Pages/misPropuestas.dart';
import 'package:camba/Pages/profile.dart';
import 'package:flutter/material.dart';

//packages

class Home extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomeInit(),
    Chat(),
    MisCambas(),
    MisPropuestas(),
    Profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final buscadorController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return cambaCreate();
              },
            ),
          );
        },
        child: Image.asset('assets/images/ic_new_camba.png'),
        backgroundColor: Colors.yellow,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey,
            ),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
              color: Colors.grey,
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.rotate_left_rounded,
              size: 30,
              color: Colors.grey,
            ),
            label: 'Cambas',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt,
              color: Colors.grey,
            ),
            label: 'Propuestas',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.grey,
            ),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}