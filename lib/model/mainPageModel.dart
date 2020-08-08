import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class MainPageModel {
  DocumentSnapshot _lastDocument;

  static MainPageModel _object;
  MainPageModel._();
  Firestore _firestore = Firestore.instance;
  static instance() {
    if (_object == null) {
      _object = MainPageModel._();
    }
    return _object;
  }

  List<MainData> mainData = [];

  Future<List<MainData>> read() async {
    QuerySnapshot querySnapshot = await _firestore
        .collection("9213903123")
        .orderBy('serverTimeStamp', descending: true)
        .limit(19)
        .getDocuments()
        .catchError((e) {
      print(e);
    });
    querySnapshot.documents.forEach((element) {
      mainData.add(MainData(
          dateTime: element.data["deviceTimeStamp"],
          message: element.data["message"],
          title: element.data["title"]));
    });

    _lastDocument = querySnapshot.documents[querySnapshot.documents.length - 1];

    print(_lastDocument.data["title"]);

    return mainData;
  }

  Future<void> readMore() async {
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

    querySnapshot.documents.forEach((element) {
      mainData.add(MainData(
          dateTime: element.data["deviceTimeStamp"],
          message: element.data["message"],
          title: element.data["title"]));
    });

    _lastDocument = querySnapshot.documents[querySnapshot.documents.length - 1];
    print(_lastDocument.data["title"]);
  }

  void create(String title, String message) {
    _firestore.collection("9213903123").document().setData(
      {
        "title": title,
        "message": message,
        "deviceTimeStamp": DateTime.now(),
        "serverTimeStamp": FieldValue.serverTimestamp(),
      },
    );
  }
}

class MainData {
  String title;
  String message;
  Timestamp dateTime;
  MainData({this.title, this.message, this.dateTime});
}
