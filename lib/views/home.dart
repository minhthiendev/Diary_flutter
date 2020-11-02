import 'package:Diary/components/menu.dart';
// import 'package:Diary/models/diary_model.dart';
import 'package:Diary/services/diary_firebase_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../components/diaryCard.dart';

class DriverList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('diary').snapshots(),
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
  void logout() {}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Map<String, String> arguments = ModalRoute.of(context).settings.arguments;
    return Container(
        child: Scaffold(
      drawer: Menu(),
      appBar: PreferredSize(
        child: AppBar(
          centerTitle: true,
          // automaticallyImplyLeading: false,
          // leading: FlatButton(
          //   child: Icon(
          //     Icons.menu,
          //     color: Colors.white,
          //   ),
          //   // onPressed: () {},
          // ),
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
      body: DriverList(),
    ));
  }
}
