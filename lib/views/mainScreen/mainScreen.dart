import 'package:awsomeNotes/appUtilities/dimensions.dart';

import 'package:awsomeNotes/model/mainPageModel.dart';
import 'package:awsomeNotes/views/mainScreen/fakeSearchField.dart';
import 'package:awsomeNotes/views/mainScreen/gridViewContainer.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'inputDialogue.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() async {
      try {
        if (scrollController.position.maxScrollExtent ==
            scrollController.position.pixels) {
          print(scrollController.position.maxScrollExtent);
          print(scrollController.position.pixels);
          await MainPageModel.instance().readMore();
          setState(() {});
        }
      } catch (e) {
        print(e);
      }

      // if(scrollController.position.maxScrollExtent==scrollController.position){

      // }
    });
    super.initState();
  }

  int counter = 0;
  @override
  Widget build(BuildContext context) {
    Dimensions(context);
    return Material(
      child: Scaffold(
        backgroundColor: Color(0xFF252525),
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: false,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => InputDialogue(),
            );
          },
          child: Icon(
            Icons.add,
            size: Dimensions.boxHeight * 5,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.boxWidth * 2),
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.boxHeight * 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Notes",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: Dimensions.boxHeight * 5),
                  ),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1,
                        child: DayNightSwitcher(
                          nightBackgroundColor: Colors.white10,
                          isDarkModeEnabled: true,
                          onStateChanged: (bool isDarkModeEnabled) {},
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.boxWidth * 3,
                      ),
                      FakeSearchBar(),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder<List<MainData>>(
                  future: counter == 0 ? MainPageModel.instance().read() : null,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      counter++;
                      return Expanded(
                        child: StaggeredGridView.countBuilder(
                          controller: scrollController,
                          padding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          crossAxisCount: 2,
                          itemCount: MainPageModel.instance().mainData.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Container(
                            child: Container(
                              color: Colors.greenAccent,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    MainPageModel.instance()
                                        .mainData[index]
                                        .title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: Dimensions.boxHeight * 3),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  SizedBox(
                                    height: Dimensions.boxHeight * 2,
                                  ),
                                  Text(
                                    MainPageModel.instance()
                                        .mainData[index]
                                        .message,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 5,
                                  ),
                                  Text(
                                    MainPageModel.instance()
                                        .mainData[index]
                                        .dateTime
                                        .toString(),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          staggeredTileBuilder: (int index) {
                            if (MainPageModel.instance()
                                    .mainData[index]
                                    .message
                                    .length >
                                20)
                              return StaggeredTile.extent(2, 100);
                            else
                              return StaggeredTile.extent(1, 100);
                          },
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                        ),
                      );
                    } else
                      return SpinKitRotatingCircle(
                        color: Colors.white,
                        size: 100.0,
                      );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
