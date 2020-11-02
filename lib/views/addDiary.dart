import 'package:Diary/services/userAuth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class AddDiary extends StatefulWidget {
  @override
  _AddDiaryState createState() => _AddDiaryState();
}

class _AddDiaryState extends State<AddDiary> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  String title;
  String diaryId = uuid.v1();
  String content;
  String created = DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
  String userId;

  _selectDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) {
      this.created = DateFormat('yyyy-MM-dd').format(value).toString();
    });
  }

  void createDiary() {
    this.diaryId = uuid.v1();
    this.userId = context.read<UserAuth>().getUser().uid;

    Map<String, dynamic> newDiary = {
      'title': title,
      'content': content,
      'created': created,
      'userId': userId,
      'diaryId': diaryId,
    };

    _db.collection('diary').doc(diaryId).set(newDiary).whenComplete(() => null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            elevation: 0,
            title: Text('New Diary'),
            backgroundColor: Hexcolor("#11274a"),
            actions: [],
          ),
          preferredSize: Size.fromHeight(70.0),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10, 30, 10, 20),
                child: Center(
                    child: TextField(
                  textCapitalization: TextCapitalization.words,
                  textAlign: TextAlign.center,
                  maxLines: null,
                  onChanged: (value) => this.title = value,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  decoration: InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal[600])),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                      labelText: 'Titile of your diary on today',
                      labelStyle: TextStyle(color: Colors.blue[600])),
                )),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 30, 10, 20),
                child: Center(
                    child: TextField(
                  onChanged: (value) => this.content = value,
                  textCapitalization: TextCapitalization.words,
                  textAlign: TextAlign.center,
                  maxLines: null,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal[600])),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                      labelText: 'Content',
                      labelStyle: TextStyle(color: Colors.blue[600])),
                )),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 30, 10, 20),
                child: Center(
                    child: TextField(
                  onChanged: (value) => this.created = value,
                  textCapitalization: TextCapitalization.words,
                  textAlign: TextAlign.center,
                  maxLines: null,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => FocusScope.of(context).unfocus(),
                  controller: new TextEditingController(text: created),
                  decoration: InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide:
                              new BorderSide(color: Hexcolor("#6ea0f0"))),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                      labelText: 'Date',
                      labelStyle: TextStyle(color: Colors.blue[600]),
                      suffixIcon: FlatButton(
                          onPressed: _selectDate,
                          child: Icon(Icons.arrow_drop_down))),
                )),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                RaisedButton(
                  color: Hexcolor("#11274a"),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(
                        width: 1.2,
                        color: Hexcolor("#6ea0f0"),
                      )),
                  onPressed: createDiary,
                  child: Text('save'),
                )
              ])
            ],
          ),
        ));
  }
}
