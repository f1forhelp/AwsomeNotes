import 'package:awsomeNotes/dimensions.dart';
import 'package:awsomeNotes/providers/mainScreenProvider.dart';
import 'package:awsomeNotes/views/mainScreen/searchBar.dart';
import 'package:awsomeNotes/widgets/dayNightCustom/dayNightCustom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.shade400,
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: Dimensions.boxHeight * 5,
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
