import 'package:Diary/services/userAuth.dart';
import 'package:Diary/views/addDiary.dart';
import 'package:Diary/views/diary_detail.dart';
import 'package:Diary/views/edit_diary.dart';
import 'package:Diary/views/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/login.dart';
import 'views/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<UserAuth>(
            create: (_) => UserAuth(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) => context.read<UserAuth>().authStateChanges,
          )
        ],
        child: MaterialApp(
          initialRoute: '/',
          routes: {
            '/Home': (builder) => Home(),
            '/AddDiary': (builder) => AddDiary(),
            '/EditDiary': (builder) => EditDiary(),
            '/DiaryDetail': (builder) => DiaryDetail(),
            '/Login': (builder) => Login(),
            '/Register': (builder) => Registerx(),
          },
          debugShowCheckedModeBanner: false,
          title: 'Driary App',
          home: Authentication(),
          theme: new ThemeData(primarySwatch: Colors.pink),
        ));
  }
}

class Register {}

class Authentication extends StatelessWidget {
  const Authentication({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      return Home();
    } else {
      return Login();
    }
  }
}
