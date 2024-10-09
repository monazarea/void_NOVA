import 'package:flutter/material.dart';
import '../widget/back.dart';
import 'exoplanetdetailscreen.dart';

class TopicDetail5Ways extends StatelessWidget {
  final List<Map<String, String>> exoplanetImages = [
    {
      'image': 'images/way1.gif',
      'details':
          'Orbiting Planets cause stars to wobble in space, changing the color of the light astronomers observe',
      'title': 'RADIAL VELOCITY',
      'subtitle1': '1092 planets discovered',
      'subtitle2': 'Watching for Wobble'
    },
    {
      'image': 'images/way2.gif',
      'details':
          "When a planet passes directly between its stars and an observer, it dims the star's light by a measurable amount",
      'title': 'TRANSIT',
      'subtitle1': '4295 planets discovered',
      'subtitle2': 'Searching for Shadows'
    },
    {
      'image': 'images/way3.gif',
      'details':
          "Astronomers can take pictures of exoplanets by removing the overwhelming glare of the stars they orbit",
      'title': 'DIRECT IMAGING',
      'subtitle1': '82 planets discovered',
      'subtitle2': 'Taking Pictures'
    },
    {
      'image': 'images/way4.gif',
      'details':
          "Light from a distant star is bent and focused by gravity as a planet passes between the star and Earth.",
      'title': 'GRAVITATIONAL MICROLENSING',
      'subtitle1': '225 planets discovered',
      'subtitle2': 'Light in a Gravity Lens'
    },
    {
      'image': 'images/way5.gif',
      'details':
          "The orbit of a planet can cause a star to wobble around in space in relation to nearby stars in the sky.",
      'title': 'ASTROMETRY',
      'subtitle1': '3 planets discovered',
      'subtitle2': 'Minuscule Movements'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Space-themed background color
      body: Stack(children: [
        Positioned.fill(
          child: Image.asset(
            'images/g33.gif', // Space-themed background image
            fit: BoxFit.cover,
          ),
        ),
        OrientationBuilder(
          builder: (context, orientation) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: exoplanetImages.length,
              itemBuilder: (context, index) {
                final exoplanet = exoplanetImages[index];
                return Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.lightBlueAccent.withOpacity(0.9),
                      // Light border color
                      width: 2.0, // Border width
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 8,
                        offset: const Offset(0, 0), // Position the shadow
                      ),
                      BoxShadow(
                        color: Colors.deepPurple.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(2, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          exoplanet['title']!,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'fam1',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          exoplanet['subtitle1']!,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'fam1',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          exoplanet['subtitle2']!,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                            fontFamily: 'fam1',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          exoplanet['image']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Details section under the image
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          exoplanet['details']!,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                            fontFamily: 'fam1',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ]),
      // Add a back button at the bottom
      floatingActionButton: const BackButtonWidget(),
    );
  }
}
