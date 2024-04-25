import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauth/pages/login_page.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'login_or_register.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Using StreamBuilder to listen to the authentication state changes
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            // Stream that notifies about changes to the user's sign-in state
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // If there is a user logged in, navigate to the HomePage
                return HomePage();
              } else {
                // If no user is logged in, navigate to the LoginOrRegisterPage to handle authentication
                return LoginOrRegisterPage();
              }
            }));
  }
}
