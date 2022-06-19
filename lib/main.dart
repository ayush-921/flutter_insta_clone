import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/responsive/mobile_screen_layout.dart';
import 'package:flutter_insta_clone/responsive/responsive_screen_layout.dart';
import 'package:flutter_insta_clone/responsive/web_screen_layout.dart';
import './utils/colors.dart';

void main() {
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
      home: const ResponsiveLayout(
          webScreenLayout: WebScreenLayout(),
          mobileScreenLayout: MobileScreenLayout()),
    );
  }
}
