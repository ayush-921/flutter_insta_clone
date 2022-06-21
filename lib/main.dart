import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/responsive/mobile_screen_layout.dart';
import 'package:flutter_insta_clone/responsive/responsive_screen_layout.dart';
import 'package:flutter_insta_clone/responsive/web_screen_layout.dart';
import 'package:flutter_insta_clone/screens/login_screen.dart';
import './utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAZEFF9_LrrqwnV0Bj5nxgdqUhMmc2zCg8",
          appId: "1:165784649696:web:67f0847e21e58b37017585",
          messagingSenderId: "165784649696",
          projectId: "flutter-insta-clone-5c983"),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: const ResponsiveLayout(
      //     webScreenLayout: WebScreenLayout(),
      //     mobileScreenLayout: MobileScreenLayout()),
      home: LoginScreen(),
    );
  }
}
