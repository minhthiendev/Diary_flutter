import 'package:Diary/services/userAuth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class Registerx extends StatefulWidget {
  @override
  _RegisterxState createState() => _RegisterxState();
}

class _RegisterxState extends State<Registerx> {
  String _email;
  String _password;
  String _password2;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            verticalDirection: VerticalDirection.down,
            children: [
              SizedBox(height: 40),
              logo(),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return "Email is required";
                  } else {
                    return (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value) ==
                            false)
                        ? 'incorect email format'
                        : null;
                  }
                },
                onChanged: (value) => _email = value,
                onSaved: (value) {
                  _email = value;
                },
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
                validator: (value) {
                  if (value.isEmpty) {
                    return "Password is required";
                  } else {
                    return (value.length < 6)
                        ? 'password must be at least 6 characters'
                        : null;
                  }
                },
                onChanged: (value) => _password = value,
                onSaved: (value) {
                  _password = value;
                },
                style: TextStyle(color: Colors.white),
                obscureText: true,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    hintText: "*************",
                    labelText: 'password',
                    labelStyle: TextStyle(
                        color: Hexcolor("#6ea0f0"), decorationThickness: 0.2)),
              ),
              SizedBox(height: 10),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return "Confirm Password is required";
                  } else {
                    return (value != _password)
                        ? 'two password is not match'
                        : null;
                  }
                },
                onChanged: (value) => _password2 = value,
                onSaved: (value) {
                  _password = value;
                },
                style: TextStyle(color: Colors.white),
                obscureText: true,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    hintText: "*************",
                    labelText: 'confirm password',
                    labelStyle: TextStyle(
                        color: Hexcolor("#6ea0f0"), decorationThickness: 0.2)),
              ),
              SizedBox(height: 30),
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
                      if (_formKey.currentState.validate()) {
                        // context.read<UserAuth>().register(_email, _password);
                      }
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/Login',
                      );
                    },
                    child: Text(
                      'Already have an account? Login',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Hexcolor("#6ea0f0")),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        margin: EdgeInsets.fromLTRB(40.0, 0, 40.0, 0.0),
      ),
      backgroundColor: Hexcolor("#11274a"),
    );
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
