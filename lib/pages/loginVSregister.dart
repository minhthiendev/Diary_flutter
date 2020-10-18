import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginVsRegsiter extends StatefulWidget {
  @override
  _LoginVsRegsiterState createState() => _LoginVsRegsiterState();
}

enum FormType { login, regsiter }

class _LoginVsRegsiterState extends State<LoginVsRegsiter> {
  String page = "login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            verticalDirection: VerticalDirection.down,
            children: createInputs() + createButtons(),
          ),
        ),
        margin: EdgeInsets.fromLTRB(40.0, 0, 40.0, 0.0),
      ),
      backgroundColor: Hexcolor("#11274a"),
    );
  }

  List<Widget> createInputs() {
    return [
      SizedBox(height: 40),
      logo(),
      TextFormField(
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
            hintText: "example@gmail.com",
            labelText: 'email',
            labelStyle: TextStyle(
                color: Hexcolor("#6ea0f0"), decorationThickness: 0.2)),
      ),
      SizedBox(height: 10),
      TextFormField(
        style: TextStyle(color: Colors.white),
        obscureText: true,
        cursorColor: Colors.white,
        decoration: InputDecoration(
            hintText: "*************",
            labelText: 'password',
            labelStyle: TextStyle(
                color: Hexcolor("#6ea0f0"), decorationThickness: 0.2)),
      ),
      SizedBox(height: 30)
    ];
  }

  List<Widget> createButtons() {
    if (page == "login")
      return [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              color: Hexcolor("#11274a"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(
                    width: 1.2,
                    color: Hexcolor("#6ea0f0"),
                  )),
              onPressed: () {
                Navigator.pushNamed(context, '/Home',
                    arguments: {'name': 'thien'});
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
            RaisedButton(
                color: Hexcolor("#11274a"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(
                      width: 1.2,
                      color: Hexcolor("#6ea0f0"),
                    )),
                onPressed: () {},
                child:
                    Image.asset("assets/images/FB.png", width: 20, height: 20)),
          ],
        ),
        FlatButton(
          onPressed: () {
            setState(() {
              page = 'register';
            });
          },
          child: Text(
            'Create new account',
            style: TextStyle(
                decoration: TextDecoration.underline,
                color: Hexcolor("#6ea0f0")),
          ),
        ),
      ];
    return [
      RaisedButton(
        color: Hexcolor("#11274a"),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(
              width: 1.2,
              color: Hexcolor("#6ea0f0"),
            )),
        onPressed: () {},
        child: Text(
          'Register',
          style: TextStyle(color: Colors.white),
        ),
      ),
      FlatButton(
        onPressed: () {
          setState(() {
            page = 'login';
          });
        },
        child: Text(
          'Already have an account? Login',
          style: TextStyle(
              decoration: TextDecoration.underline, color: Hexcolor("#6ea0f0")),
        ),
      ),
    ];
  }

  Widget logo() {
    return Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 130.0,
        child: Image.asset(
          "assets/images/diary.png",
        ),
      ),
    );
  }
}
