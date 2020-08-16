import 'package:cloud_firestore/cloud_firestore.dart';

class MainPageService {
  Firestore _firestore = Firestore.instance;
  DocumentSnapshot _lastDocument;

  Future<QuerySnapshot> read() async {
    QuerySnapshot querySnapshot = await _firestore
        .collection("9213903123")
        .orderBy('serverTimeStamp', descending: true)
        .limit(19)
        .getDocuments()
        .catchError((e) {
      print(e);
    });

    _lastDocument = querySnapshot.documents[querySnapshot.documents.length - 1];

    return querySnapshot;
  }

  Future<QuerySnapshot> readMore() async {
    QuerySnapshot querySnapshot = await _firestore
        .collection("9213903123")
        .orderBy('serverTimeStamp', descending: true)
        .limit(20)
        .startAfter(
          [
            _lastDocument.data['serverTimeStamp'],
          ],
        )
        .getDocuments()
        .catchError((e) {
          print(e);
        });

    _lastDocument = querySnapshot.documents[querySnapshot.documents.length - 1];
    return querySnapshot;
  }

  Future<bool> create(String title, String message) async {
    print("1");
    bool sentResult = false;
    await _firestore.collection("9213903123").document().setData(
      {
        "title": title,
        "message": message,
        "deviceTimeStamp": DateTime.now(),
        "serverTimeStamp": FieldValue.serverTimestamp(),
      },
    ).catchError((e) {
      print(e);
      sentResult = false;
    }).then((value) => {sentResult = true});
    print("2");
    return sentResult;
  }
}
