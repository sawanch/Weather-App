import 'package:firebaseauth/components/auth_page.dart';
import 'package:firebaseauth/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'components/home_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure proper initialization of Flutter bindings before using Firebase
  await Firebase.initializeApp(
    name: 'authtutorial',
    options: DefaultFirebaseOptions
        .currentPlatform, // Initialize Firebase using default platform-specific settings
  );
  runApp(const MyApp()); // Start the application
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor for MyApp, an immutable widget

  // This widget is the root of your application and sets up the initial screen
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner
      home: AuthPage(), // Set AuthPage as the initial route of the app
    );
  }
}
