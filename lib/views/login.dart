import 'package:Diary/services/userAuth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email;
  String _password;
  String message;
  final _formKey = GlobalKey<FormState>();

  // Future<Widget> message(Function x) async {
  //   String y = await x();
  //   return SnackBar(content: Text(y));
  // }
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
                color: Colors.red,
              ),
            ),
            Expanded(
              child: Text(message,
                  style: TextStyle(
                    color: Colors.red[300],
                  )),
            ),
            FlatButton(
                onPressed: () {
                  setState(() {
                    this.message = null;
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
                            .login(_email, _password)
                            .then((value) => setState(() {
                                  this.message = value;
                                }));
                      }
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
                      child: Image.asset("assets/images/FB.png",
                          width: 20, height: 20)),
                ],
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/Register',
                  );
                },
                child: Text(
                  'Create new account',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Hexcolor("#6ea0f0")),
                ),
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
