import 'package:awsomeNotes/widgets/submitButton.dart';
import 'package:flutter/material.dart';

import '../../dimensions.dart';

class MainPageDialogue extends StatelessWidget {
  const MainPageDialogue({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.blue,
      child: Container(
        width: Dimensions.boxWidth * 80,
        height: Dimensions.boxHeight * 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.boxHeight * 2),
          color: Colors.white,
        ),
        child: Column(
          children: [
            SubmitButton(),
          ],
        ),
      ),
    );
  }
}
