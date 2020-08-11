import 'package:awsomeNotes/dimensions.dart';
import 'package:awsomeNotes/providers/mainScreenProvider.dart';
import 'package:awsomeNotes/widgets/dayNightCustom/dayNightCustom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions(context);
    return Scaffold(
      backgroundColor: Color(0xFF252525),
      body: Column(
        children: [
          SizedBox(
            height: Dimensions.boxHeight * 7.5,
          ),
          TopAppBar(),
        ],
      ),
    );
  }
}

class TopAppBar extends StatefulWidget {
  @override
  _TopAppBarState createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  double width = 50;
  @override
  void initState() {
    super.initState();
    FocusManager.instance.addListener(() {});
  }

  @override
  void dispose() {
    print("dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "NOTES",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: Dimensions.boxHeight * 5),
        ),
        Container(
          width: Dimensions.boxWidth * 20,
          height: Dimensions.boxHeight * 5,
          child: FittedBox(
              fit: BoxFit.fill,
              child: DayNightSwitcher(
                  isDarkModeEnabled: true, onStateChanged: (v) {})),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.decelerate,
          width: width,
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                size: Dimensions.boxHeight * 5,
                color: Colors.white,
              ),
              contentPadding: EdgeInsets.all(0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.boxHeight * 1),
                borderSide: BorderSide.none,
              ),
              //fillColor: Color(0xFF3B3B3B),
              fillColor: Colors.blue,
              filled: true,
            ),
          ),
        ),
      ],
    );
  }
}
