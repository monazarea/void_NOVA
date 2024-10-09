import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:void_nova/screens/cards.dart';
import 'package:void_nova/screens/game.dart';
import 'package:void_nova/widget/back.dart';
import '../widget/custom_button.dart';
import '../widget/exit.dart';
import 'learn.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image 1
          Positioned.fill(
            child: Image.asset(
              'images/g1.gif',
              fit: BoxFit.cover,
            ),
          ),
          // Background Image 2
          Positioned.fill(
            child: Image.asset(
              'images/home.png',
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.3), // Optional: Add a color overlay
              colorBlendMode: BlendMode.darken, // Optional: Use a blend mode
            ),
          ),
          // Content (Buttons)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Custom Button 1
               SizedBox(
                 width:350,
                 child: CustomButton(
                    text: "Explore the Universe",
                   onPressed: () {
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => Cards()),
                     );
                     //_openLink('https://drive.google.com/file/d/1G8o5PpbhbjhEF40oAaWfQA-9XS0G9LAP');
                   },
                  ),
               ),
                const SizedBox(height: 20),
                // Custom Button 2
                SizedBox(
                  width: 390,
                  child: CustomButton(
                    text: "Learn About Exoplanets",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LearningScreen()),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                // Custom Button 3
                const SizedBox(
                  width: 200,
                  child: Positioned(
                    bottom: 20,
                    right: 20,
                    child: ExitButtonWidget(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Future<void> _openLink(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication); // Open in external browser like Chrome
    } else {
      throw 'Could not launch $url';
    }
  }
}
