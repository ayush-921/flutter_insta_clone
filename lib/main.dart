import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/api.dart';
import 'package:flutter_insta_clone/provider/user_provider.dart';
import 'package:flutter_insta_clone/responsive/mobile_screen_layout.dart';
import 'package:flutter_insta_clone/responsive/responsive_screen_layout.dart';
import 'package:flutter_insta_clone/responsive/web_screen_layout.dart';
import 'package:flutter_insta_clone/screens/login_screen.dart';
import 'package:provider/provider.dart';
import './utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    APIKey key = APIKey();
    String x = key.returnKey();
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: x,
        appId: "1:165784649696:web:67f0847e21e58b37017585",
        messagingSenderId: "165784649696",
        projectId: "flutter-insta-clone-5c983",
        storageBucket: "flutter-insta-clone-5c983.appspot.com",
      ),
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: mobileBackgroundColor,
          ),
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return const ResponsiveLayout(
                      webScreenLayout: WebScreenLayout(),
                      mobileScreenLayout: MobileScreenLayout());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                );
              }
              return const LoginScreen();
            },
          )
          //SignUpScreen(),
          ),
    );
  }
}
