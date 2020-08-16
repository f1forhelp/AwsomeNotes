import 'package:flutter/material.dart';

class Delete extends StatefulWidget {
  @override
  _DeleteState createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.blueAccent.shade100,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.blueAccent.shade100,
            ),
          ),
          FlatButton(onPressed: () {}, child: Text("Hiiiii")),
        ],
      ),
    );
  }
}
