import 'package:awsomeNotes/main.dart';
import 'package:awsomeNotes/services/mainPageService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../constants.dart';

class MainScreenProvider extends ChangeNotifier {
  bool isFirst = false;
  int _colourCounter = 0;
  Color colourProvider() {
    if (_colourCounter < tileColors.length)
      return tileColors[_colourCounter++];
    else {
      _colourCounter = 0;
      return tileColors[_colourCounter];
    }
  }

  Future<QuerySnapshot> getData() async {
    return await getIt<MainPageService>().read();
  }

  Future<QuerySnapshot> getMore() async {
    return await getIt<MainPageService>().readMore();
  }
}
