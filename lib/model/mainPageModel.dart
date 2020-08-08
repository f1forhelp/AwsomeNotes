import 'package:cloud_firestore/cloud_firestore.dart';

class MainPageModel {
  static MainPageModel _object;
  MainPageModel._();
  Firestore _firestore = Firestore.instance;
  static instance() {
    if (_object == null) {
      _object = MainPageModel._();
    }
    return _object;
  }

  Future<void> read() async {
    Timestamp timestamp;

    print("reading");
    QuerySnapshot querySnapshot = await _firestore
        .collection("9213903123")
        .orderBy('word', descending: true)
        .getDocuments();
    querySnapshot.documents.forEach((element) {});
  }

  void create(String word, String meaning) {
    _firestore.collection("9213903123").document().setData(
      {
        "word": word,
        "meaning": meaning,
        "timeStamp": FieldValue.serverTimestamp()
      },
    );
  }
}
