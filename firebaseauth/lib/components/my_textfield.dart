import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller; // Controller to manage the text field input
  final String hintText; // Placeholder text for the text field
  final bool
      obscureText; // Determines if the text should be obscured (for passwords)

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      // Horizontal padding for the text field
      child: TextField(
        controller: controller,
        // Assigns the passed controller to manage text input
        obscureText: obscureText,
        // Toggles the visibility of text input
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white), // White border in default state
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors
                      .grey.shade400), // Grey border when the field is focused
            ),
            fillColor: Colors.grey.shade200,
            // Background color of the text field
            filled: true,
            hintText: hintText,
            // Placeholder text
            hintStyle: TextStyle(
                color: Colors.grey[500])), // Style for the placeholder text
      ),
    );
  }
}
