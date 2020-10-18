import 'package:Diary/firebase/userAuth.dart';
import 'package:Diary/pages/addDiary.dart';
import 'package:Diary/pages/home.dart';
import 'package:flutter/material.dart';
import 'pages/loginVSregister.dart';

void main() {
  final user = UserAuth();
  user.register("bdbdbdb@gmail.com", '123');
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/Home': (builder) => Home(),
      '/AddDiary': (builder) => AddDiary(),
    },
    debugShowCheckedModeBanner: false,
    title: 'Driary App',
    home: LoginVsRegsiter(),
    theme: new ThemeData(primarySwatch: Colors.pink),
  ));
}
