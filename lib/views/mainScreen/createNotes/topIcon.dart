import 'package:flutter/material.dart';

import '../../../dimensions.dart';

class TopIcons extends StatelessWidget {
  final Widget widget;
  final double padding;
  final Function function;
  TopIcons({this.widget, this.padding, this.function});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.function,
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: Color(0xFF3B3B3B),
          borderRadius: BorderRadius.circular(Dimensions.boxHeight * 1.8),
        ),
        child: widget,
      ),
    );
  }
}
