import 'package:awsomeNotes/appUtilities/dimensions.dart';
import 'package:flutter/material.dart';

class GridViewContainer extends StatelessWidget {
  final int val;
  GridViewContainer(this.val);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        val.toString(),
        style: TextStyle(fontSize: 20),
      ),
      // width: Dimensions.boxWidth * 10,
      //height: Dimensions.boxHeight * 25,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.all(
          Radius.circular(Dimensions.boxHeight * 2),
        ),
      ),
    );
  }
}
