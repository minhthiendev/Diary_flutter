import 'package:flutter/material.dart';

class DiaryCard extends StatelessWidget {
  final String title;
  final String content;
  final String created;
  final String diaryId;
  DiaryCard({this.title, this.content, this.created, this.diaryId});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        // SizedBox(height: 15),
        ListTile(
            leading: Icon(Icons.book),
            title: Text(this.title),
            subtitle: Text(this.content),
            trailing: Text(this.created),
            onTap: () {
              Navigator.pushNamed(context, '/DiaryDetail', arguments: {
                'diaryId': this.diaryId,
                'diaryTitle': this.title
              });
            },
            onLongPress: () {}),
        Divider(
          color: Colors.green[300],
          height: 10,
          indent: 20,
          endIndent: 20,
        )
      ],
    ));
  }
}
