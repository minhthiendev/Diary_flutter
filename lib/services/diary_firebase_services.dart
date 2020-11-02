import 'package:Diary/models/diary_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  List<DiaryModel> list = [];
  //get diary
  List<DiaryModel> getAllDiary() {
    _db.collection('diary').get().then((value) {
      list.clear();
      value.docs.map((map) => list.add(DiaryModel.fromJson(map.data())));
    });
    return list;
  }

  //upsert
  Future<void> setDiary(DiaryModel diary) {
    var option = SetOptions(merge: true);
    return _db
        .collection('diary')
        .doc(diary.diaryId)
        .set(diary.toMap(), option);
  }

  //delete diary
  Future<void> removeDiary(String diaryId) {
    return _db.collection('diary').doc(diaryId).delete();
  }
}
