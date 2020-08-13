import 'package:awsomeNotes/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class MainPageService {
  Firestore _firestore = Firestore.instance;
  DocumentSnapshot _lastDocument;
  int _colourCounter = 0;

  Color colourProvider() {
    if (_colourCounter < tileColors.length)
      return tileColors[_colourCounter++];
    else {
      _colourCounter = 0;
      return tileColors[_colourCounter];
    }
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
    querySnapshot.documents.forEach(
      (element) {
        mainData.add(
          MainData(
            dateTime: element.data["deviceTimeStamp"].toDate(),
            message: element.data["message"],
            title: element.data["title"],
            color: colourProvider(),
          ),
        );
      },
    );

    _lastDocument = querySnapshot.documents[querySnapshot.documents.length - 1];

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
        dateTime: element.data["deviceTimeStamp"].toDate(),
        message: element.data["message"],
        title: element.data["title"],
        color: colourProvider(),
      ));
    });

    _lastDocument = querySnapshot.documents[querySnapshot.documents.length - 1];
  }

  create(String title, String message) async {
    await _firestore.collection("9213903123").document().setData(
      {
        "title": title,
        "message": message,
        "deviceTimeStamp": DateTime.now(),
        "serverTimeStamp": FieldValue.serverTimestamp(),
      },
    ).catchError((e) {
      print(e);
    });
  }
}

class MainData {
  Color color;
  String title;
  String message;
  DateTime dateTime;
  MainData({this.title, this.message, this.dateTime, this.color});
}
