import 'package:flutter/material.dart';

import '../../dimensions.dart';

class OtpField extends StatelessWidget {
  final String val;
  OtpField(this.val);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, 0),
      width: Dimensions.boxWidth * 10,
      height: Dimensions.boxHeight * 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.boxHeight * 1),
        color: Colors.white.withOpacity(0.2),
      ),
      child: Text(
        this.val,
        style: TextStyle(
          color: Colors.white,
          fontSize: Dimensions.boxHeight * 4.5,
        ),
      ),
    );
  }
}
