import 'package:flutter/material.dart';
import '../widget/back.dart';

class ExoplanetDetailScreen extends StatelessWidget {
  final String imagePath;
  final String details;
  final String title;

  ExoplanetDetailScreen(
      {required this.imagePath, required this.details, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'images/g33.gif', // Space-themed background image
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'fam1',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.lightBlueAccent.withOpacity(0.9),
                              width: 2.0,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueAccent.withOpacity(0.5),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                                offset: Offset(0.0, 0.0),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          details,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ), // Customize text style
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Positioned(
            bottom: 10,
            right: 20,
            child: BackButtonWidget(),
          ),
        ],
      ),
    );
  }
}
