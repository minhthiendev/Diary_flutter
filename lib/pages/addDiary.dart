import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AddDiary extends StatefulWidget {
  @override
  _AddDiaryState createState() => _AddDiaryState();
}

class _AddDiaryState extends State<AddDiary> {
  DateTime selectedDate = DateTime.now();

  _selectDate() {
    showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) {
      setState() {
        selectedDate = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            leading: FlatButton(
              child: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            title: Text('New Diary'),
            backgroundColor: Hexcolor("#11274a"),
            actions: [
              FlatButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  )),
            ],
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
                  textCapitalization: TextCapitalization.words,
                  textAlign: TextAlign.center,
                  maxLines: null,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => FocusScope.of(context).unfocus(),
                  onTap: _selectDate,
                  decoration: InputDecoration(
                      hintText: selectedDate.toString(),
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal[600])),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                      labelText: 'Date',
                      labelStyle: TextStyle(color: Colors.blue[600]),
                      suffixIcon: Icon(Icons.edit)),
                )),
              ),
            ],
          ),
        ));
  }
}
