import 'package:flutter/material.dart';

import '../dimensions.dart';

class SubmitButton extends StatelessWidget {
  SubmitButton({this.function});
  final Function function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        child: Text(
          "SUBMIT",
          style: TextStyle(
            fontSize: Dimensions.boxHeight * 2,
            color: Colors.white,
            fontWeight: FontWeight.w800,
            letterSpacing: 1,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.boxHeight * 0.8),
          color: Color(0xFFE42959),
        ),
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.boxHeight * 1.3,
          horizontal: Dimensions.boxHeight * 2,
        ),
      ),
    );
  }
}
