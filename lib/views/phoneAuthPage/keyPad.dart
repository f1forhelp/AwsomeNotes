import 'dart:io';

import 'package:awsomeNotes/dimensions.dart';
import 'package:flutter/material.dart';

class KeyPad extends StatelessWidget {
  final Function(String) keyListen;
  final Function deleteFunction;
  KeyPad({this.keyListen, this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.boxHeight * 5,
        horizontal: Dimensions.boxHeight * 5,
      ),
      width: double.infinity,
      height: Dimensions.boxHeight * 50,
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
                    return keyListen(val);
                  },
                ),
                OtpButtons(
                  value: "2",
                  function: (val) {
                    return keyListen(val);
                  },
                ),
                OtpButtons(
                  value: "3",
                  function: (val) {
                    return keyListen(val);
                  },
                ),
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
                    return keyListen(val);
                  },
                ),
                OtpButtons(
                  value: "5",
                  function: (val) {
                    return keyListen(val);
                  },
                ),
                OtpButtons(
                  value: "6",
                  function: (val) {
                    return keyListen(val);
                  },
                ),
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
                    return keyListen(val);
                  },
                ),
                OtpButtons(
                  value: "8",
                  function: (val) {
                    return keyListen(val);
                  },
                ),
                OtpButtons(
                  value: "9",
                  function: (val) {
                    return keyListen(val);
                  },
                ),
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
                    return keyListen(val);
                  },
                ),
                OtpButtons(
                  value: "0",
                  function: (val) {
                    return keyListen(val);
                  },
                ),
                DeleteButton(function: this.deleteFunction),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DeleteButton extends StatelessWidget {
  final Function function;
  DeleteButton({this.function});
  continueDelet() {
    for (int i = 0; i < 15; i++) {
      sleep(Duration(milliseconds: 200));
      print(i);
    }
  }

  final double borderWidth = 3;
  final Color borderColour = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.tealAccent.shade100.withOpacity(0.2),
          onTap: () {
            function();
          },
          child: Container(
            margin: EdgeInsets.all(Dimensions.boxHeight * 0.3),
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            alignment: Alignment(0, 0),
            width: 50,
            height: 50,
            child: Icon(
              Icons.backspace,
              color: Colors.white,
              size: Dimensions.boxHeight * 4,
            ),
          ),
        ),
      ),
    );
  }
}

class OtpButtons extends StatelessWidget {
  final Function(String) function;
  final String value;
  OtpButtons({this.function, this.value});

  final double borderWidth = 3;
  final Color borderColour = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.tealAccent.shade100.withOpacity(0.2),
          onTap: () => function(value),
          child: Container(
            margin: EdgeInsets.all(Dimensions.boxHeight * 0.3),
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            alignment: Alignment(0, 0),
            width: 50,
            height: 50,
            child: Text(
              value,
              style: TextStyle(
                  fontSize: Dimensions.boxHeight * 4,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
      ),
    );
  }
}
