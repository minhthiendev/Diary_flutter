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

  @override
  Widget build(BuildContext context) {
    Map<String, String> arguments = ModalRoute.of(context).settings.arguments;

    final diaryId = arguments['diaryId'];

    Widget diaryDetail() {
      return FutureBuilder(
          future: _db.collection('diary').doc(diaryId).get(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(snapshot.data['title']),
                    Text(snapshot.data['created']),
                    Text(snapshot.data['content']),
                    FlatButton(
                      child: Text("edit"),
                      onPressed: () {
                        Navigator.pushNamed(context, '/EditDiary');
                      },
                    )
                  ],
                ),
              );
            }
            return Text('loading...');
          });
    }

    // .then((value) {
    //   setState(() {
    //     this.diary = value.data();
    //   });
    // });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Hexcolor("#11274a"),
      ),
      body: SingleChildScrollView(child: diaryDetail()),
    );
  }
}
