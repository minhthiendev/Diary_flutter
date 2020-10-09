import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginVsRegsiter extends StatefulWidget {
  @override
  _LoginVsRegsiterState createState() => _LoginVsRegsiterState();
}

class _LoginVsRegsiterState extends State<LoginVsRegsiter> {
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
        showCursor: true,
        decoration: InputDecoration(
            labelText: 'email',
            labelStyle: TextStyle(
                color: Hexcolor("#6ea0f0"), decorationThickness: 0.2)),
      ),
      SizedBox(height: 10),
      TextFormField(
        decoration: InputDecoration(
            labelText: 'password',
            labelStyle: TextStyle(
                color: Hexcolor("#6ea0f0"), decorationThickness: 0.2)),
      ),
      SizedBox(height: 60)
    ];
  }

  List<Widget> createButtons() {
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
          'login',
          style: TextStyle(color: Colors.white),
        ),
      ),
      FlatButton(
        onPressed: () {},
        child: Text(
          'create new account',
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
