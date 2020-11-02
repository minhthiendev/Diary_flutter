import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class EditDiary extends StatefulWidget {
  @override
  _EditDiaryState createState() => _EditDiaryState();
}

class _EditDiaryState extends State<EditDiary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(
          child: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        title: Text('Edit diary'),
        backgroundColor: Hexcolor("#11274a"),
        actions: [
          FlatButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.save,
                color: Colors.white,
              )),
          FlatButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.save,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
