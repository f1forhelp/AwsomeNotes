import 'package:awsomeNotes/appUtilities/themeProvider.dart';
import 'package:awsomeNotes/services/phoneValidationService.dart';
import 'package:awsomeNotes/views/SplashScreen/splashScreen.dart';
import 'package:awsomeNotes/views/loadingScreen/loadingScreen.dart';
import 'package:awsomeNotes/views/mainScreen/mainScreen.dart';
import 'package:awsomeNotes/views/noInternetConnection/noInternetConnection.dart';
import 'package:awsomeNotes/views/phoneAuthPage/phoneAuthPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusNode focusNode = FocusScope.of(context);
        if (focusNode.hasPrimaryFocus) {
          focusNode.unfocus();
        }
      },
      child: MaterialApp(
        home: PhoneAuthPage(),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusNode focusNode = FocusScope.of(context);
//         if (!focusNode.hasPrimaryFocus) {
//           focusNode.unfocus();
//         }
//       },
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: StreamBuilder<FirebaseUser>(
//           stream: FirebaseAuth.instance.onAuthStateChanged,
//           builder: (context, snapshot) {
//             print(snapshot.connectionState);
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return LoadingScreen();
//             } else if (snapshot.connectionState == ConnectionState.active &&
//                 !snapshot.hasData) {
//               return SplashScreen();
//             } else if (snapshot.connectionState == ConnectionState.active &&
//                 snapshot.hasData) {
//               return MainScreen();
//             } else
//               return null;
//           },
//         ),
//       ),
//     );
//   }
// }
