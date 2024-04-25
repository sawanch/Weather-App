import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath; // Path to the image used inside the tile
  final Function()? onTap; // Callback function for tap action

  const SquareTile({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Handle tap action
      child: Container(
        padding: EdgeInsets.all(20), // Padding around the image
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          // White border around the tile
          borderRadius: BorderRadius.circular(16),
          // Rounded corners
          color: Colors.grey[200], // Background color of the tile
        ),
        child:
            Image.asset(imagePath, height: 40), // Image displayed in the tile
      ),
    );
  }
}
