import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class EditDiary extends StatefulWidget {
  @override
  _EditDiaryState createState() => _EditDiaryState();
}

class _EditDiaryState extends State<EditDiary> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  String title;
  String content;
  String created;

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

  @override
  Widget build(BuildContext context) {
    Map<String, String> arguments = ModalRoute.of(context).settings.arguments;

    final diaryId = arguments['diaryId'];
    Future<Widget> showDialogz() async {
      return await showDialog<Widget>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('anounment'),
              content: Text(' this diary is updated !'),
              actions: [
                FlatButton(
                  child: Text('Oke'),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/DiaryDetail',
                        arguments: {'diaryId': diaryId, 'diaryTitle': title});
                  },
                ),
              ],
            );
          });
    }

    void showMessage() {
      showDialogz();
    }

    void upadateDiary() {
      print(title);
      _db.collection('diary').doc(diaryId).update({
        'title': title,
        'content': content,
        'created': created
      }).whenComplete(() {
        showMessage();
      });
    }

    Widget diaryDetail() {
      return FutureBuilder(
          future: _db.collection('diary').doc(diaryId).get(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              title = snapshot.data['title'];
              content = snapshot.data['content'];
              created = snapshot.data['created'];
              return Scaffold(
                  appBar: PreferredSize(
                    child: AppBar(
                      elevation: 0,
                      title: Text(title.length < 30
                          ? title
                          : title.substring(0, 31) + "..."),
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
                            onChanged: (value) {
                              this.title = value;
                            },
                            textInputAction: TextInputAction.next,
                            controller: new TextEditingController(text: title),
                            decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.teal[600])),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.blue),
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
                            controller:
                                new TextEditingController(text: content),
                            decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.teal[600])),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.blue),
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
                            controller:
                                new TextEditingController(text: created),
                            decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Hexcolor("#6ea0f0"))),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.blue),
                                ),
                                labelText: 'Date',
                                labelStyle: TextStyle(color: Colors.blue[600]),
                                suffixIcon: FlatButton(
                                    onPressed: _selectDate,
                                    child: Icon(Icons.arrow_drop_down))),
                          )),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RaisedButton(
                                color: Hexcolor("#11274a"),
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                      width: 1.2,
                                      color: Hexcolor("#6ea0f0"),
                                    )),
                                onPressed: upadateDiary,
                                child: Text('save'),
                              ),
                              // RaisedButton(
                              //   color: Hexcolor("#11274a"),
                              //   textColor: Colors.white,
                              //   shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(18.0),
                              //       side: BorderSide(
                              //         width: 1.2,
                              //         color: Hexcolor("#6ea0f0"),
                              //       )),
                              //   onPressed: () {},
                              //   child: Text('review'),
                              // )
                            ])
                      ],
                    ),
                  ));
            }
            return Scaffold(
              body: Text('loading...'),
            );
          });
    }

    return diaryDetail();
  }
}
