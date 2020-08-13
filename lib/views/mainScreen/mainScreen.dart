import 'package:awsomeNotes/dimensions.dart';
import 'package:awsomeNotes/views/mainScreen/createNotes.dart';
import 'package:awsomeNotes/views/mainScreen/searchBar.dart';
import 'package:awsomeNotes/widgets/dayNightCustom/dayNightCustom.dart';
import 'package:awsomeNotes/widgets/submitButton.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions(context);
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: Colors.teal.shade400,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateNotes(),
              ),
            );
          },
          child: Icon(
            Icons.add,
            size: Dimensions.boxHeight * 5,
          ),
        ),
      ),
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xFF252525),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.boxWidth * 4),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: Dimensions.boxHeight * 8,
                ),
                SearchBar(),
                // StaggeredGridView.builder(
                //   gridDelegate: SliverStaggeredGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: null, staggeredTileBuilder: null),
                //   itemBuilder: (context, index) {},
                // ),
              ],
            ),
            Align(
              alignment: Alignment(-0.92, 0.92),
              child: Container(
                width: Dimensions.boxWidth * 20,
                height: Dimensions.boxHeight * 5,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: DayNightSwitcher(
                    isDarkModeEnabled: true,
                    onStateChanged: (v) {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
