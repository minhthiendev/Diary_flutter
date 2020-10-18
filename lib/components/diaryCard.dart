import 'package:flutter/material.dart';

class DiaryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(height: 15),
        ListTile(
            leading: Icon(Icons.book),
            title: Text('this is diary title in today '),
            subtitle: Text('this is diary content in today'),
            trailing: Text('today'),
            onTap: () {},
            onLongPress: () {}),
        Divider(
          color: Colors.black,
          height: 20,
          indent: 20,
          endIndent: 20,
        )
      ],
    ));
  }
}
