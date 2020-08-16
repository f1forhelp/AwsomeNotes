import 'package:awsomeNotes/dimensions.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final int maxCharacter;
  final int maxLength;
  final String hintText;
  final Function(String) onPressed;
  const CustomTextField({
    this.maxCharacter,
    this.onPressed,
    this.hintText,
    this.maxLength,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  int length = 0;
  @override
  Widget build(BuildContext context) {
    Dimensions(context);
    return TextFormField(
      validator: (value) {
        setState(() {
          length = value.length;
        });
        widget.onPressed(value);
        if (value == null || value.length == 0) {
          return "This field can't be empty";
        } else if (value.length > widget.maxCharacter) {
          return "Max ${widget.maxCharacter} allowed";
        } else
          return null;
      },
      maxLines: this.widget.maxLength,
      style: TextStyle(
        color: Colors.white,
        fontSize: Dimensions.boxHeight * 3,
      ),
      decoration: InputDecoration(
        errorStyle: TextStyle(
          color: Colors.red,
          fontSize: Dimensions.boxHeight * 2.2,
          fontWeight: FontWeight.w600,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(Dimensions.boxHeight * 2),
        ),
        fillColor: Colors.blue.withOpacity(0.2),
        filled: true,
        hintText: this.widget.hintText,
        hintStyle: TextStyle(
          color: Colors.white38,
          fontSize: Dimensions.boxHeight * 3,
        ),
        counterText: this.length.toString(),
        counterStyle: TextStyle(
          color: Colors.white70,
          fontSize: Dimensions.boxHeight * 2.5,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
