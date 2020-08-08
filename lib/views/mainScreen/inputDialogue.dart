import 'package:awsomeNotes/appUtilities/dimensions.dart';
import 'package:awsomeNotes/model/mainPageModel.dart';
import 'package:flutter/material.dart';

class InputDialogue extends StatelessWidget {
  const InputDialogue({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.boxHeight * 2),
      ),
      backgroundColor: Colors.blueGrey,
      content: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InputTextField(
              borderRadius: 100,
              maxLength: 1,
              hintText: "WORD",
            ),
            SizedBox(
              height: Dimensions.boxHeight * 2,
            ),
            InputTextField(
              borderRadius: Dimensions.boxHeight * 2.5,
              maxLength: 4,
              hintText: "MEANING",
            ),
          ],
        ),
      ),
      actions: [
        RawMaterialButton(
          onPressed: () {
            MainPageModel.instance().create("tata", "motors");
          },
          child: Text(
            "SUBMIT",
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
        RawMaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "CANCEL",
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class InputTextField extends StatelessWidget {
  final int maxLength;
  final String hintText;
  final double borderRadius;
  InputTextField({
    this.hintText,
    this.borderRadius,
    this.maxLength,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimensions.boxWidth * 35,
      child: TextFormField(
        cursorColor: Colors.white,
        style: TextStyle(
          color: Colors.white,
          fontSize: Dimensions.boxHeight * 2.7,
        ),
        maxLines: this.maxLength,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: Dimensions.boxHeight * 1.5,
            horizontal: Dimensions.boxWidth * 1.5,
          ),
          hintText: this.hintText,
          hintStyle: TextStyle(
              color: Colors.white70, fontSize: Dimensions.boxHeight * 2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(this.borderRadius),
          ),
        ),
      ),
    );
  }
}
