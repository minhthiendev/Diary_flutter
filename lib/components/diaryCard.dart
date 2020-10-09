import 'package:flutter/material.dart';

class DiaryCard extends StatelessWidget {
  // String title;
  // String content;
  // String createAt;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
          leading: Icon(Icons.book),
          title: Text(
              'this is diary title in today this is diary title in todaythis is diary title in today'),
          subtitle: Text('this is diary content in today'),
          trailing: Text('today'),
          onTap: () {},
          onLongPress: () {}),
    );
  }
}
