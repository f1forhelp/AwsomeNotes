import 'package:awsomeNotes/appUtilities/dimensions.dart';
import 'package:flutter/material.dart';

class FakeSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: Dimensions.boxWidth * 80,
        height: Dimensions.boxHeight * 6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: Dimensions.boxHeight * 1,
                color: Colors.black26,
                spreadRadius: Dimensions.boxHeight * 0.1),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              width: Dimensions.boxWidth * 2,
            ),
            Icon(
              Icons.search,
              color: Colors.black38,
              size: Dimensions.boxHeight * 4,
            ),
            SizedBox(
              width: Dimensions.boxWidth * 2,
            ),
            Text(
              "Search Notes..",
              style: TextStyle(
                color: Colors.black45,
                fontSize: Dimensions.boxHeight * 2.5,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
