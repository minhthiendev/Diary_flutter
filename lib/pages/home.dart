import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../components/diaryCard.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, String> arguments = ModalRoute.of(context).settings.arguments;
    return Container(
        child: Scaffold(
            appBar: PreferredSize(
              child: AppBar(
                centerTitle: true,
                leading: FlatButton(
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                title: Image.asset(
                  "assets/images/diary.png",
                  width: 120,
                  height: 120,
                ),
                backgroundColor: Hexcolor("#11274a"),
                actions: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(Icons.search)),
                  Text(arguments['name'])
                ],
              ),
              preferredSize: Size.fromHeight(70.0),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Hexcolor("#11274a"),
              onPressed: () {
                Navigator.pushNamed(context, '/AddDiary');
              },
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  DiaryCard(),
                ],
              ),
            )));
  }
}
