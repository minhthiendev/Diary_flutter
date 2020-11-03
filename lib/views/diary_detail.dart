import 'package:Diary/models/diary_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DiaryDetail extends StatefulWidget {
  @override
  _DiaryDetailState createState() => _DiaryDetailState();
}

class _DiaryDetailState extends State<DiaryDetail> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<Widget> showAlert() async {
    return await showDialog<Widget>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('hey'),
            content: Text(' Diary was deleted !'),
            actions: [
              FlatButton(
                child: Text('oke'),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/Home',
                  );
                },
              ),
            ],
          );
        });
  }

  void alert() {
    showAlert();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> arguments = ModalRoute.of(context).settings.arguments;

    final diaryId = arguments['diaryId'];
    final diaryTitle = arguments['diaryTitle'];

    Future<Widget> showDialogz() async {
      return await showDialog<Widget>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('hey'),
              content: Text(' Diary will be deleted !'),
              actions: [
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () async {
                    await FirebaseFirestore.instance
                        .collection("diary")
                        .doc(diaryId)
                        .delete();
                    alert();
                  },
                ),
                FlatButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
    }

    void _deleteDiary() {
      showDialogz();
    }

    Widget diaryDetail() {
      return FutureBuilder(
          future: _db.collection('diary').doc(diaryId).get(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return Container(
                margin: EdgeInsets.only(top: 40),
                padding: EdgeInsets.all(20),
                // decoration: BoxDecoration(
                //     shape: BoxShape.rectangle,
                //     borderRadius: BorderRadius.circular(12),
                //     color: Colors.green[300]),
                child: Column(
                  children: [
                    Text(snapshot.data['title'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Text(snapshot.data['created'],
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 17,
                          )),
                    ]),
                    Divider(
                      thickness: 1,
                      color: Colors.blueGrey,
                      height: 20,
                      indent: 260,
                    ),
                    Text(snapshot.data['content'],
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.green[600],
                            fontSize: 22,
                            fontWeight: FontWeight.w300)),
                    Divider(
                      thickness: 1,
                      color: Colors.blueGrey,
                      height: 20,
                    ),
                  ],
                ),
              );
            }
            return Text('loading...');
          });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Hexcolor("#11274a"),
        elevation: 0,
        title: Text(diaryTitle.length < 30
            ? diaryTitle
            : diaryTitle.substring(0, 31) + "..."),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, '/EditDiary',
                  arguments: {'diaryId': diaryId});
            },
            child: Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
          FlatButton(
            onPressed: _deleteDiary,
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(child: diaryDetail()),
    );
  }
}
