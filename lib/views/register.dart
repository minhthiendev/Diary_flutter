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
  String message;
  bool success;
  final _formKey = GlobalKey<FormState>();

  Widget showMessage() {
    if (message != null)
      return Container(
        width: double.infinity,
        color: Hexcolor("#6ea0f0"),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.warning,
                color: success ? Colors.green : Colors.red,
              ),
            ),
            Expanded(
              child: Text(message,
                  style: TextStyle(
                    color: success ? Colors.green : Colors.red[300],
                    fontWeight: FontWeight.bold,
                  )),
            ),
            FlatButton(
                onPressed: () {
                  setState(() {
                    this.message = null;
                    this.success = false;
                  });
                },
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ))
          ],
        ),
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.all(10),
      );
    return SizedBox(height: 0);
  }

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
              showMessage(),
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
                        context
                            .read<UserAuth>()
                            .register(_email, _password)
                            .then((value) {
                          print(value);
                          if (value == 'success')
                            return setState(() {
                              this.message =
                                  'congratulations ! your account is created';
                              this.success = true;
                            });
                          return setState(() {
                            this.message = value;
                          });
                        });
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
