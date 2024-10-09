import 'package:flutter/material.dart';
import '../widget/back.dart';
import 'exoplanetdetailscreen.dart';

class Gallery extends StatelessWidget {
  final List<Map<String, String>> exoplanetImages = [
    {
      'image': 'images/im1.jpg',
      'details': 'K2-33b, shown in this illustration, is one of the youngest exoplanets detected to date using NASA Kepler Space Telescope. It makes a complete orbit around its star in about five days. These two characteristics combined provide exciting new directions for planet-formation theories. K2-33b could have formed on a farther out orbit and quickly migrated inward.',
      'title': 'Exoplanet Orbits Youthful Star'
    },
    {
      'image': 'images/im2.jpg',
      'details': "TOI 700, a planetary system 100 light-years away in the constellation Dorado, is home to TOI 700 d, the first Earth-size habitable-zone planet discovered by NASA's Transiting Exoplanet Survey Satellite.",
      'title': 'TOI 700 Artists’ Illustration'
    },
    {
      'image': 'images/im4.jpg',
      'details': "This illustration shows a red dwarf star orbited by a hypothetical exoplanet. Red dwarfs tend to be magnetically active, displaying gigantic arcing prominences and a wealth of dark sunspots. Red dwarfs also erupt with intense flares that could strip a nearby planet's atmosphere over time, or make the surface inhospitable to life as we know it.",
      'title': 'Flaring Red Dwarf Star (Illustration)'
    },
    {
      'image': 'images/im3.jpg',
      'details': "This artist's illustration shows a gas giant planet circling a pair of red dwarf stars in the system OGLE-2007-BLG-349, located 8,000 light-years away. The Saturn-mass planet orbits roughly 300 million miles from the stellar duo. The two red dwarf stars are 7 million miles apart.",
      'title': 'Exoplanet OGLE-2007-BLG-349'
    },
    {
      'image': 'images/im5.jpg',
      'details': "This is an artistic illustration of the giant planet HR 8799b. The planet was first discovered in 2007 at the Gemini North observatory. The planet is young and hot, at a temperature of 1500 degrees Fahrenheit. It is slightly larger than Jupiter and may be at least seven times more massive.",
      'title': 'Artist’s Concept of Exoplanet HR 8799b'
    },
    {
      'image': 'images/im6.jpg',
      'details': "WASP-18b is an exoplanet located 325 light-years from Earth. The planet's mass is 10 times that of Jupiter, and it orbits its star once every 23 hours. A study found that this planet has a stratosphere loaded with carbon dioxide, but no signs of water.",
      'title': 'WASP-18b (Artist’s Concept)'
    },
  ];

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
              const Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 10),
                child: Center(
                  child: Text(
                    'Exoplanet Gallery',
                    style: TextStyle(
                      fontFamily: 'fam1',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal, // Horizontal scrolling
                    itemCount: exoplanetImages.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExoplanetDetailScreen(
                                imagePath: exoplanetImages[index]['image']!,
                                details: exoplanetImages[index]['details']!,
                                title: exoplanetImages[index]['title']!,
                              ),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 180,
                              height: 180,
                              margin: EdgeInsets.symmetric(horizontal: 10),
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
                                  exoplanetImages[index]['image']!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 160, // Control width for the title
                              child: Text(
                                exoplanetImages[index]['title']!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: 'fam1',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                softWrap: true, // Allow wrapping
                                overflow: TextOverflow.visible, // Prevent text from being cut off
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
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
