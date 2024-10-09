import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            // Border with a purple gradient
            border: Border.all(
              color: Colors.lightBlue.withOpacity(1),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(26),
            // Adding lighting effect with shadow
            boxShadow: [
              BoxShadow(
                color: Colors.lightBlueAccent.withOpacity(0.2),
                spreadRadius: 7,
                blurRadius: 8,
                offset: Offset(0, 0), // Shadow position
              ),
            ],
            // Background with transparency (lighting effect)
            gradient: LinearGradient(
              colors: [
                Colors.lightBlueAccent.withOpacity(0.001),
                Colors.lightBlueAccent.withOpacity(0.001),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Text color
                fontFamily: 'fam1',  // Custom font family
              ),
            ),
          ),
        ),
      ),
    );
  }
}
