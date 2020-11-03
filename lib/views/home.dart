import 'package:Diary/components/menu.dart';
// import 'package:Diary/models/diary_model.dart';
import 'package:Diary/services/diary_firebase_services.dart';
import 'package:Diary/services/userAuth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../components/diaryCard.dart';
import 'package:provider/provider.dart';

class DiaryList extends StatelessWidget {
  final String uid;
  DiaryList(this.uid);
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('diary')
          .where('userId', isEqualTo: this.uid)
          .orderBy('title', descending: false)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Text('Loading...');
        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot x) {
            // print(x.data());
            return DiaryCard(
              diaryId: x.data()['diaryId'],
              content: x.data()['content'].length < 30
                  ? x.data()['content']
                  : x.data()['content'].toString().substring(0, 30) + ' ...',
              created: x.data()['created'],
              title: x.data()['title'],
            );
          }).toList(),
        );
      },
    );
  }
}

class DiaryListAfterSearch extends StatelessWidget {
  final String uid;
  // final String date;

  DiaryListAfterSearch(
    this.uid,
    // this.date,
  );
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('diary')
          .where('userId', isEqualTo: this.uid)
          .where('created', isEqualTo: '2020-11-03')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Text('Loading...');
        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot x) {
            // print(x.data());
            return DiaryCard(
              diaryId: x.data()['diaryId'],
              content: x.data()['content'].length < 30
                  ? x.data()['content']
                  : x.data()['content'].toString().substring(0, 30) + ' ...',
              created: x.data()['created'],
              title: x.data()['title'],
            );
          }).toList(),
        );
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final fireStoreService = FireStoreService();
  String uid;
  String date;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.uid = context.read<UserAuth>().getUser().uid;
  }

  Future<Widget> search() async {
    return await showDialog<Widget>(
        context: context,
        builder: (BuildContext context) {
          return Scaffold(
              body: Container(
            // width: double.infinity,
            color: Hexcolor("#6ea0f0"),
            child: Form(
              key: _formKey,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                // verticalDirection: VerticalDirection.down,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Email is required";
                      }
                      // else {
                      //   return (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      //               .hasMatch(value) ==
                      //           false)
                      //       ? 'incorect email format'
                      //       : null;
                      // }
                    },
                    onChanged: (value) => date = value,
                    onSaved: (value) {
                      date = value;
                    },
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        hintText: "example@gmail.com",
                        labelText: 'email',
                        labelStyle: TextStyle(
                            color: Hexcolor("#6ea0f0"),
                            decorationThickness: 0.2)),
                  ),
                  FlatButton(
                    onPressed: () {
                      // if (_formKey.currentState.validate()) {}
                    },
                    child: Text(
                      'go',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Hexcolor("#6ea0f0")),
                    ),
                  ),
                ],
              ),
            ),
            padding: EdgeInsets.all(10),
          ));
        });
  }

  void showSearch() {
    search();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      drawer: Menu(),
      appBar: PreferredSize(
        child: AppBar(
          centerTitle: true,
          title: Image.asset(
            "assets/images/diary.png",
            width: 120,
            height: 120,
          ),
          backgroundColor: Hexcolor("#11274a"),
          actions: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: FlatButton(
                    onPressed: null,
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ))),
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
      body: DiaryList(uid),
    ));
  }
}
