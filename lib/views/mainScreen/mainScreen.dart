import 'package:awsomeNotes/appUtilities/dimensions.dart';
import 'package:awsomeNotes/model/demoData.dart';
import 'package:awsomeNotes/model/mainPageModel.dart';
import 'package:awsomeNotes/views/mainScreen/fakeSearchField.dart';
import 'package:awsomeNotes/views/mainScreen/gridViewContainer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'inputDialogue.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  data() async {
    FirebaseUser firebaseUser;
    firebaseUser = await FirebaseAuth.instance.currentUser();
    print(firebaseUser.phoneNumber);
  }

  Future<void> temp() async {
    for (int i = 0; i < 50; i++) {
      await MainPageModel.instance().create(i, i.toString());
    }
  }

  Future<void> demo() async {
    print(scrollController.position.maxScrollExtent);
  }

  ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    //temp();
    //MainPageModel.instance().read();
    super.initState();
    scrollController.addListener(() {
      demo();
    });
    //data();
  }

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
                  FakeSearchBar(),
                ],
              ),
              Expanded(
                child: StaggeredGridView.countBuilder(
                  controller: scrollController,
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  crossAxisCount: 2,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) => Container(
                    child: Container(
                      color: Colors.greenAccent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            lisData[index].word,
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
                            lisData[index].meaning,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  staggeredTileBuilder: (int index) {
                    if (lisData[index].meaning.length > 20)
                      return StaggeredTile.extent(2, 100);
                    else
                      return StaggeredTile.extent(1, 100);
                  },
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
