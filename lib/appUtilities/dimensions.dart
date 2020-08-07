import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Dimensions {
  static double boxWidth;
  static double boxHeight;

  Dimensions(context) {
    boxHeight = MediaQuery.of(context).size.height / 100;
    boxWidth = MediaQuery.of(context).size.height / 100;
  }
}
