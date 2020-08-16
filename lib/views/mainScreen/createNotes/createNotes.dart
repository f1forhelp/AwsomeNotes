import 'package:awsomeNotes/dimensions.dart';
import 'package:awsomeNotes/main.dart';
import 'package:awsomeNotes/services/mainPageService.dart';
import 'package:awsomeNotes/views/mainScreen/createNotes/topIcon.dart';
import 'package:flutter/material.dart';

import 'cystomTextField.dart';

class CreateNotes extends StatefulWidget {
  @override
  _CreateNotesState createState() => _CreateNotesState();
}

class _CreateNotesState extends State<CreateNotes> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool autoValidate = false;
  String title;
  String message;
  @override
  Widget build(BuildContext context) {
    Dimensions(context);
    return Scaffold(
      resizeToAvoidBottomInset: autoValidate,
      backgroundColor: Color(0xFF252525),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.boxWidth * 4),
        child: SingleChildScrollView(
          child: Form(
            autovalidate: autoValidate,
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.boxHeight * 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TopIcons(
                      function: () {},
                      padding: Dimensions.boxHeight * 0.5,
                      widget: Icon(
                        Icons.navigate_before,
                        color: Colors.white,
                        size: Dimensions.boxHeight * 6,
                      ),
                    ),
                    TopIcons(
                      function: () {
                        if (formKey.currentState.validate()) {
                          getIt<MainPageService>()
                              .create(this.title, this.message)
                              .then((value) {
                            print(value);
                          }).catchError((e) {
                            print(e);
                          });
                        } else {
                          print("else 0");
                          setState(() {
                            autoValidate = true;
                          });
                        }
                      },
                      padding: Dimensions.boxHeight * 2.2,
                      widget: Text(
                        "Save",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Dimensions.boxHeight * 2.6,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.boxHeight * 4,
                ),
                CustomTextField(
                  maxCharacter: 200,
                  maxLength: 1,
                  onPressed: (val) {
                    this.title = val;
                  },
                  hintText: "Title",
                ),
                SizedBox(
                  height: Dimensions.boxHeight * 3,
                ),
                CustomTextField(
                  maxCharacter: 2000,
                  maxLength: 10,
                  onPressed: (val) {
                    this.message = val;
                  },
                  hintText: "Message",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
