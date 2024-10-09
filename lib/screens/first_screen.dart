import 'dart:async';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:void_nova/screens/home.dart';

import '../widget/background_video_widget.dart';
class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _ScreenState();
}
class _ScreenState extends State<FirstScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animationController.forward();
    Timer(const Duration(seconds: 3),(){

    });
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            // Background GIF
            Positioned.fill(
              child: Image.asset(
                'images/g1.gif',
                fit: BoxFit.cover, // Ensures the GIF covers the entire screen
              ),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  ScaleTransition(
                    scale: Tween<double>(begin: 0, end: 1).animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Curves.easeOut,
                      ),
                    ),
                    child: Image.asset('images/space.png', height: 360),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
