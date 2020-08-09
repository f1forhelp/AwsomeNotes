import 'package:awsomeNotes/appUtilities/dimensions.dart';
import 'package:flutter/material.dart';

class PhoneAuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions(context);
    return Material(
      color: Color(0xFFFCFDFE),
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.transparent,
              child: Column(
                children: [],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(Dimensions.boxHeight * 5),
            width: double.infinity,
            height: Dimensions.boxHeight * 45,
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              //mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      OtpButtons(
                          value: "1",
                          function: (val) {
                            print(val);
                          },
                          side: [0]),
                      OtpButtons(
                          value: "2",
                          function: (val) {
                            print(val);
                          },
                          side: [3, 1]),
                      OtpButtons(
                          value: "3",
                          function: (val) {
                            print(val);
                          },
                          side: [0]),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      OtpButtons(
                          value: "4",
                          function: (val) {
                            print(val);
                          },
                          side: [2]),
                      OtpButtons(
                          value: "5",
                          function: (val) {
                            print(val);
                          },
                          side: [3, 1, 2]),
                      OtpButtons(
                          value: "6",
                          function: (val) {
                            print(val);
                          },
                          side: [2]),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      OtpButtons(
                          value: "7",
                          function: (val) {
                            print(val);
                          },
                          side: [2]),
                      OtpButtons(
                          value: "8",
                          function: (val) {
                            print(val);
                          },
                          side: [1, 2, 3]),
                      OtpButtons(
                          value: "9",
                          function: (val) {
                            print(val);
                          },
                          side: [2]),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      OtpButtons(
                          value: "",
                          function: (val) {
                            print(val);
                          },
                          side: [2]),
                      OtpButtons(
                          value: "0",
                          function: (val) {
                            print(val);
                          },
                          side: [1, 2, 3]),
                      OtpButtons(
                          value: "+",
                          function: (val) {
                            print(val);
                          },
                          side: [2]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OtpButtons extends StatelessWidget {
  final Function(String) function;
  final String value;
  final List<int> side;
  const OtpButtons({this.function, this.value, this.side});

  final double borderWidth = 2;
  final Color borderColour = Colors.blueAccent;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => function(value),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
              bottom: side.contains(4)
                  ? BorderSide(
                      color: borderColour,
                      width: this.borderWidth,
                    )
                  : BorderSide.none,
              top: side.contains(2)
                  ? BorderSide(
                      color: borderColour,
                      width: this.borderWidth,
                    )
                  : BorderSide.none,
              right: side.contains(3)
                  ? BorderSide(
                      color: borderColour,
                      width: this.borderWidth,
                    )
                  : BorderSide.none,
              left: side.contains(1)
                  ? BorderSide(
                      color: borderColour,
                      width: this.borderWidth,
                    )
                  : BorderSide.none,
            ),
          ),
          alignment: Alignment(0, 0),
          width: 50,
          height: 50,
          child: Text(
            value,
            style: TextStyle(fontSize: Dimensions.boxHeight * 3.5),
          ),
        ),
      ),
    );
  }
}
