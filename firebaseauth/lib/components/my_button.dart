import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap; // Callback function for tap event
  final String text; // Text to display on the button

  const MyButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Assigns the onTap callback to handle user interaction
      child: Container(
        padding: EdgeInsets.all(25),
        // Padding inside the button
        margin: EdgeInsets.symmetric(horizontal: 25),
        // Margin around the button
        decoration: BoxDecoration(
            color: Colors.black, // Button background color
            borderRadius: BorderRadius.circular(12)),
        // Rounded corners for the button
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, // Text color
                fontWeight: FontWeight.bold, // Text weight
                fontSize: 16), // Text size
          ),
        ),
      ),
    );
  }
}
