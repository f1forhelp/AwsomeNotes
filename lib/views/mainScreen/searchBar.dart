import 'package:flutter/material.dart';

import '../../dimensions.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  double opacity = 1;
  double width = Dimensions.boxWidth * 12;
  double radius = Dimensions.boxHeight * 1;
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    FocusManager.instance.addListener(
      () {
        if (FocusManager.instance.primaryFocus.debugLabel == null) {
          width = Dimensions.boxWidth * 100;
          radius = Dimensions.boxHeight * 50;
          opacity = 0;
          setState(() {});
        } else {
          width = Dimensions.boxWidth * 12;
          radius = Dimensions.boxHeight * 1;
          opacity = 1;
          textEditingController.clear();
          setState(() {});
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    print("dispose");
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              opacity: opacity,
              child: Text(
                "NOTES",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: Dimensions.boxHeight * 5),
              ),
            ),
            SizedBox(
              width: Dimensions.boxWidth * 5,
            ),
          ],
        ),
        Align(
          alignment: Alignment(1, 0),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.decelerate,
            width: width,
            child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  size: Dimensions.boxHeight * 5,
                  color: Colors.white,
                ),
                contentPadding: EdgeInsets.all(0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(this.radius),
                  borderSide: BorderSide.none,
                ),
                //fillColor: Color(0xFF3B3B3B),
                fillColor: Colors.blue,
                filled: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
