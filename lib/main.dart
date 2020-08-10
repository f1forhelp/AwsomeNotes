import 'package:awsomeNotes/providers/otpProvider.dart';
import 'package:awsomeNotes/providers/phoneProvider.dart';
import 'package:awsomeNotes/themeProvider.dart';
import 'package:awsomeNotes/model/phoneAuthenticationModel.dart';
import 'package:awsomeNotes/views/otpPage/otpPage.dart';
import 'package:awsomeNotes/views/phonePage/phoneAuthPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void main() async {
  getIt.registerSingleton<PhoneAuthenticationModel>(PhoneAuthenticationModel());
  // getIt.registerSingleton<PhoneOtpProvider>(PhoneOtpProvider());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OtpProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PhoneProvider(),
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
        debugShowCheckedModeBanner: false,
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
