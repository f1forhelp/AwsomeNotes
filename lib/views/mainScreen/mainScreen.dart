import 'package:awsomeNotes/appUtilities/dimensions.dart';
import 'package:awsomeNotes/model/mainPageModel.dart';
import 'package:awsomeNotes/views/mainScreen/fakeSearchField.dart';
import 'package:awsomeNotes/views/mainScreen/gridViewContainer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    //temp();
    //MainPageModel.instance().read();
    super.initState();
    //data();
  }

  @override
  Widget build(BuildContext context) {
    Dimensions(context);
    return Scaffold(
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
        padding: EdgeInsets.symmetric(horizontal: Dimensions.boxWidth * 3),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.boxHeight * 8,
            ),
            FakeSearchBar(),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.8,
                  crossAxisCount: 2,
                  crossAxisSpacing: Dimensions.boxWidth * 2,
                  mainAxisSpacing: Dimensions.boxHeight * 2,
                ),
                itemBuilder: (context, val) {
                  return GridViewContainer(val);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
