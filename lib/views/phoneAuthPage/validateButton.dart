import 'package:awsomeNotes/dimensions.dart';
import 'package:awsomeNotes/services/phoneValidationService.dart';
import 'package:awsomeNotes/views/mainScreen/mainScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ValidateButton extends StatelessWidget {
  const ValidateButton({
    @required this.formState,
  });
  final GlobalKey<FormState> formState;
  pageNavigate(context) async {
    FirebaseUser firebaseUser;
    firebaseUser = await FirebaseAuth.instance.currentUser();
    if (firebaseUser == null) {
    } else
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (formState.currentState.validate()) {
          await PhoneValidationService.instance().verifyPhone();
          await pageNavigate(context);
        } else {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.deepOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              content: Text(
                "Please enter valid detial",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimensions.boxHeight * 2,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(Dimensions.boxHeight * 2),
        ),
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.boxHeight * 1.5,
          horizontal: Dimensions.boxWidth * 2.5,
        ),
        child: Text(
          "VALIDATE",
          style: TextStyle(
            fontSize: Dimensions.boxHeight * 2,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
