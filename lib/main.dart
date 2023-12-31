import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:scoring_app/auth/splash_screen.dart';
import 'package:sizer/sizer.dart';

import 'homescreens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    const MyApp(),
  );
}

// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  Sizer(
        builder: (context, orientation, deviceType)  {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        }
    );
  }
}


