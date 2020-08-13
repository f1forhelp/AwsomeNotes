import 'package:awsomeNotes/dimensions.dart';
import 'package:flutter/material.dart';

class CreateNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFF252525),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.boxHeight * 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TopIcons(
                    padding: Dimensions.boxHeight * 0.5,
                    widget: Icon(
                      Icons.navigate_before,
                      color: Colors.white,
                      size: Dimensions.boxHeight * 6,
                    ),
                  ),
                  TopIcons(
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
                hintText: "Title",
                maxLength: 1,
              ),
              SizedBox(
                height: Dimensions.boxHeight * 4,
              ),
              CustomTextField(
                hintText: "Content",
                maxLength: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final int maxLength;
  final String hintText;
  final Function(String) onPressed;
  const CustomTextField({
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
    return TextFormField(
      onChanged: (val) {
        setState(() {
          length = val.length;
        });
        return this.widget.onPressed(val);
      },
      maxLines: this.widget.maxLength,
      style: TextStyle(
        color: Colors.white24,
        fontSize: Dimensions.boxHeight * 3,
      ),
      decoration: InputDecoration(
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

class TopIcons extends StatelessWidget {
  final Widget widget;
  final double padding;
  TopIcons({this.widget, this.padding});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Color(0xFF3B3B3B),
        borderRadius: BorderRadius.circular(Dimensions.boxHeight * 1.8),
      ),
      child: widget,
    );
  }
}
