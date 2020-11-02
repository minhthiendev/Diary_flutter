import 'package:flutter/foundation.dart';

class DiaryModel {
  String title;
  String diaryId;
  String content;
  String created;
  final String userId;
  DiaryModel(
      {@required this.diaryId,
      @required this.userId,
      @required this.title,
      @required this.content,
      @required this.created});
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'created': created,
      'userId': userId,
      'diaryId': diaryId,
    };
  }

  factory DiaryModel.fromJson(Map<String, dynamic> map) {
    if (map == null) return null;
    return DiaryModel(
      diaryId: map['diaryId'],
      title: map['title'],
      content: map['content'],
      created: map['created'],
      userId: map['userId'],
    );
  }
}
