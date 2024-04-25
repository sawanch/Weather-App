import 'package:firebaseauth/components/register_page.dart';
import 'package:firebaseauth/pages/login_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  // Boolean to track whether the login page or registration page should be shown
  bool showLoginPage = true;

  // Method to toggle between the login and registration pages
  void togglePages() {
    setState(() {
      showLoginPage =
          !showLoginPage; // Toggle the boolean state to switch views
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
          onTap: togglePages); // Show the login page if 'showLoginPage' is true
    } else {
      return RegisterPage(
        onTap:
            togglePages, // Show the register page if 'showLoginPage' is false
      );
    }
  }
}
