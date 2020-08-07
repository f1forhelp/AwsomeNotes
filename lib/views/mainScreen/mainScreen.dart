import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    data();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text("Main Screen"),
      ),
    );
  }
}
