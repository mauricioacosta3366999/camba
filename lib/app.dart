import 'package:camba/Login/login.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    //SharedPreferences.setMockInitialValues({});
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Login(),
      ),
    );
  }
}
