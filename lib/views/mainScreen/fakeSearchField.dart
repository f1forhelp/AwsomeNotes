import 'package:awsomeNotes/dimensions.dart';
import 'package:flutter/material.dart';

class FakeSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, 0),
      width: Dimensions.boxHeight * 6,
      height: Dimensions.boxHeight * 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.boxHeight * 2),
        color: Color(0xFF3B3B3B),
      ),
      child: Icon(
        Icons.search,
        size: Dimensions.boxHeight * 4,
        color: Colors.white,
      ),
    );
  }
}
