import 'package:awsomeNotes/appUtilities/dimensions.dart';
import 'package:awsomeNotes/model/mainPageModel.dart';
import 'package:flutter/material.dart';

class InputDialogue extends StatefulWidget {
  final Function stateFunction;

  const InputDialogue({Key key, this.stateFunction});

  @override
  _InputDialogueState createState() => _InputDialogueState();
}

class _InputDialogueState extends State<InputDialogue> {
  String title = "";
  String message = "";
  @override
  Widget build(BuildContext context) {
    Dimensions(context);
    return Builder(
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.boxHeight * 2),
        ),
        backgroundColor: Colors.blueGrey,
        content: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InputTextField(
                borderRadius: 100,
                maxLength: 1,
                hintText: "Title",
                onChange: (val) {
                  this.title = val;
                },
              ),
              SizedBox(
                height: Dimensions.boxHeight * 2,
              ),
              InputTextField(
                onChange: (val) {
                  this.message = val;
                },
                borderRadius: Dimensions.boxHeight * 2.5,
                maxLength: 4,
                hintText: "Note",
              ),
            ],
          ),
        ),
        actions: [
          RawMaterialButton(
            onPressed: () async {
              try {
                await MainPageModel.instance().create(title, message);
                MainPageModel.instance().mainData.insert(
                      0,
                      MainData(
                        dateTime: DateTime.now(),
                        message: this.message,
                        title: this.title,
                        color: MainPageModel.instance().colourProvider(),
                      ),
                    );
              } catch (e) {
                print(e);
              }
              widget.stateFunction();
            },
            child: Text(
              "SUBMIT",
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
            ),
          ),
          RawMaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "CANCEL",
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class InputTextField extends StatelessWidget {
  final int maxLength;
  final String hintText;
  final double borderRadius;
  final Function(String) onChange;
  InputTextField({
    this.onChange,
    this.hintText,
    this.borderRadius,
    this.maxLength,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimensions.boxWidth * 35,
      child: TextFormField(
        onChanged: (val) {
          return onChange(val);
        },
        cursorColor: Colors.white,
        style: TextStyle(
          color: Colors.white,
          fontSize: Dimensions.boxHeight * 2.7,
        ),
        maxLines: this.maxLength,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: Dimensions.boxHeight * 1.5,
            horizontal: Dimensions.boxWidth * 1.5,
          ),
          hintText: this.hintText,
          hintStyle: TextStyle(
              color: Colors.white70, fontSize: Dimensions.boxHeight * 2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(this.borderRadius),
          ),
        ),
      ),
    );
  }
}

List ls = [];
a() {
  ls.insert(0, "cc");
}
