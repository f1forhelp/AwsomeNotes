import 'package:awsomeNotes/providers/otpProvider.dart';
import 'package:awsomeNotes/providers/phoneProvider.dart';
import 'package:awsomeNotes/services/mainPageService.dart';
import 'package:awsomeNotes/services/phoneValidationService.dart';
import 'package:awsomeNotes/themeProvider.dart';
import 'package:awsomeNotes/views/delete.dart';
import 'package:awsomeNotes/views/mainScreen/createNotes/createNotes.dart';
import 'package:awsomeNotes/views/mainScreen/mainScreen.dart';
import 'package:awsomeNotes/views/otpPage/otpPage.dart';
import 'package:awsomeNotes/views/phonePage/phoneAuthPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:hive/hive.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  await Hive.openBox("fireStoreCache");
  getIt.registerSingleton<PhoneValidationService>(PhoneValidationService());
  getIt.registerSingleton<MainPageService>(MainPageService());
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
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
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
