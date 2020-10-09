import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../components/diaryCard.dart';

class Home extends StatelessWidget {
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
          title: Text('My Diary', textAlign: TextAlign.center),
          backgroundColor: Hexcolor("#11274a"),
          actions: [Icon(Icons.search)],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Hexcolor("#11274a"),
          onPressed: () {},
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              DiaryCard(),
              DiaryCard(),
              DiaryCard(),
              DiaryCard(),
              DiaryCard(),
              DiaryCard(),
              DiaryCard(),
              DiaryCard(),
              DiaryCard(),
              DiaryCard(),
              DiaryCard(),
              DiaryCard(),
              DiaryCard(),
              DiaryCard(),
              DiaryCard(),
              DiaryCard(),
              DiaryCard(),
              DiaryCard(),
              DiaryCard(),
            ],
          ),
        ));
  }
}
