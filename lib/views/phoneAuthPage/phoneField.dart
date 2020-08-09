import 'package:awsomeNotes/dimensions.dart';
import 'package:flutter/material.dart';

class PhoneField extends StatelessWidget {
  final String text;
  PhoneField({this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment(-0.8, 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: Dimensions.boxHeight * 1,
                    color: Colors.blue.shade200,
                    spreadRadius: Dimensions.boxHeight * 0.1),
              ]),
          width: Dimensions.boxWidth * 85,
          height: Dimensions.boxHeight * 8,
          child: Text(
            this.text,
            softWrap: true,
            style: TextStyle(
              fontSize: Dimensions.boxHeight * 3.5,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
