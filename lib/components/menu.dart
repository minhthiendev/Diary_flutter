import 'dart:ui';
import 'package:Diary/services/userAuth.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String x;

  @override
  void initState() {
    super.initState();
    this.x = context.read<UserAuth>().getUser().email;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height: 170,
            padding: EdgeInsets.all(20),
            color: Hexcolor("#11274a"),
            child: Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(28),
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      x.substring(0, 1).toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Hexcolor("#6ea0f0"),
                    ),
                  ),
                  Text(x,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Hexcolor("#6ea0f0"),
                border: Border.all(
                    color: Colors.white, width: 1.0, style: BorderStyle.solid)),
            height: 50,
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Setting    ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(Icons.settings)
              ],
            )),
          ),
          Container(
            decoration: BoxDecoration(
                color: Hexcolor("#6ea0f0"),
                border: Border.all(
                    color: Colors.white, width: 1.0, style: BorderStyle.solid)),
            height: 50,
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  child: Text(
                    "Logout    ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () async {
                    return await context.read<UserAuth>().signOut();

                    // Navigator.pushNamed(context, '/Login');
                  },
                ),
                Icon(Icons.logout)
              ],
            )),
          ),
          Container(
              padding: EdgeInsets.only(top: 300),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Hexcolor("#11274a"),
                  ),
                  child: FlatButton(
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Hexcolor("#6ea0f0"),
                        size: 30,
                      )),
                ),
              )),
        ],
      )),
    );
  }
}
