import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context); // Navigate back to the previous screen
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: Colors.lightBlue.withOpacity(.7),
              width: 2.0, // Border width
            ),
          ),
          backgroundColor: Colors.transparent, // Transparent background
          shadowColor: Colors.blueAccent.withOpacity(0.7), // Shadow color
          elevation: 10, // Shadow elevation outside the button
        ),
        child: const Text(
          'Back',
          style: TextStyle(
            fontFamily: 'fam1',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
