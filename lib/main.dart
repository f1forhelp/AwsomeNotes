import 'package:awsomeNotes/appUtilities/themeProvider.dart';
import 'package:awsomeNotes/views/mainScreen/mainScreen.dart';
import 'package:awsomeNotes/views/phoneAuth/phoneAuth.dart';
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
    return MaterialApp(
      home: PhoneAuth(),
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
//         home: StreamBuilder(
//           stream: FirebaseAuth.instance.onAuthStateChanged,
//           builder: (context, snapshotData) {
//             if (snapshotData.connectionState == ConnectionState.active) {
//               if (snapshotData.connectionState == ConnectionState.waiting) {
//                 return LoadingScreen();
//               } else if (snapshotData.hasData) {
//                 return MainScreen();
//               } else {
//                 return SplashScreen();
//               }
//             } else {
//               return NoInternetConnection();
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
