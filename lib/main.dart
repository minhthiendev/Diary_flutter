import 'package:flutter/material.dart';
// import 'pages/home.dart';
import 'pages/loginVSregister.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Driary App',
    home: LoginVsRegsiter(),
    theme: new ThemeData(primarySwatch: Colors.pink),
  ));
}
