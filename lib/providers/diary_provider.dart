// import 'package:Diary/models/diary_model.dart';
// import 'package:flutter/foundation.dart';
// import 'package:Diary/services/diary_firebase_services.dart';
// import 'package:uuid/uuid.dart';

// class DiaryProvider with ChangeNotifier {
//   final fireStoreService = FireStoreService();
//   DateTime _created;
//   String _title;
//   String _content;
//   String _diaryId;
//   String _userId;
//   var uuid = Uuid();

//   DateTime get created => _created;
//   String get title => _title;
//   String get content => _content;
//   String get userId => _userId;
//   String get diary => _diaryId;
//   Stream<List<DiaryModel>> get listDiary => fireStoreService.getDiary();

//   set changeDate(DateTime date) {
//     _created = date;
//     notifyListeners();
//   }

//   set changeTitle(String title) {
//     _title = title;
//     notifyListeners();
//   }

//   set chageContent(String content) {
//     _content = content;
//     notifyListeners();
//   }

//   loadAll(DiaryModel diary) {
//     if (diary != null) {
//       // _created = diary.created;
//       _title = diary.title;
//       _content = diary.content;
//       _diaryId = diary.diaryId;
//     } else {
//       _created = DateTime.now();
//       _title = null;
//       _content = null;
//       _diaryId = null;
//       _userId = null;
//       ;
//     }
//   }

//   saveDiary() {
//     if (_diaryId == null) {
//       var newDiary = DiaryModel(
//           // created: _created,
//           title: _title,
//           content: _content,
//           userId: 'thien',
//           diaryId: uuid.v1());

//       fireStoreService.setDiary(newDiary);
//     }
//   }
// }
