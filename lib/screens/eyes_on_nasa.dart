import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class EyesOnNasa extends StatelessWidget {
  final String url = 'https://eyes.nasa.gov/apps/exo/#/'; // Replace with your URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: WebViewWidget(
              controller: WebViewController()
                ..loadRequest(Uri.parse(url)) // Load the URL
                ..setJavaScriptMode(JavaScriptMode.unrestricted), // Allows JavaScript
            ),
          ),


          Positioned(
            top: 15,
            left: 15,
            child: Row(
              children: [

                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 10),
                // Custom Text
                const Text(
                  'Eyes on Exoplanets',
                  style: TextStyle(
                    fontFamily: 'fam1',
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
