import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widget/back.dart';

class Cards extends StatelessWidget {
  // Sample data for books
  final List<Map<String, String>> cards = [
    {
      'image': 'images/card1.png',
      'link': 'https://drive.google.com/file/d/1G8o5PpbhbjhEF40oAaWfQA-9XS0G9LAP', // Link for card 1
    },
    {
      'image': 'images/card2.png',
      'link': 'https://drive.google.com/file/d/1FQmXxD4R1sq7q1XnXw5cnHt_b8US72Iw', // Link for card 2
    },
    {
      'image': 'images/card3.png',
      'link': 'https://drive.google.com/file/d/1D1VndHYNwtI0qUoZc5_zQ3t34Vv1G4tw', // Link for card 3
    },
    {
      'image': 'images/card4.png',
      'link': 'https://drive.google.com/file/d/1fNhC0Qk9BHIJ5sf0SgA5A8dZBg1HjV-1', // Link for card 4
    },
  ];

  int selectedCardIndex = 0; // Keep track of the selected card

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'images/g33.gif', // Background image
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'E-Library',
                  style: TextStyle(
                    fontFamily: 'fam1',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 200, // Reduced height of ListView
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          selectedCardIndex = index; // Update selected index on tap
                        },
                        child: _buildBookCard(cards[index]),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                // Button Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _openBookLink(cards[selectedCardIndex]['link']!);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Colors.blueAccent,
                      ),
                      child: const Text(
                        'Download',
                        style: TextStyle(
                          fontFamily: 'fam1',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20), // Space between buttons
                    ElevatedButton(
                      onPressed: () {
                        _openBookLink('https://drive.google.com/file/d/1G8o5PpbhbjhEF40oAaWfQA-9XS0G9LAP');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Colors.blueAccent,
                      ),
                      child: const Text(
                        'Explore the Universe',
                        style: TextStyle(
                          fontFamily: 'fam1',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20), // Additional space
              ],
            ),
          ),
          const Positioned(
            top: 10, // Adjust the position of the button from the top
            right: 20, // Adjust the position of the button from the right
            child: BackButtonWidget(),
          ),
        ],
      ),
    );
  }

  Widget _buildBookCard(Map<String, String> book) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.only(right: 16.0),
      color: Colors.transparent,
      child: Container(
        width: 250, // Set the card width
        height: 150, // Decreased the card height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.lightBlueAccent.withOpacity(0.9), // Light border color
            width: 2.0, // Border width
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.3),
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: const Offset(0.0, 0.0),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            book['image']!,
            fit: BoxFit.cover, // Adjust image fit
          ),
        ),
      ),
    );
  }

  // Function to open book link in browser
  Future<void> _openBookLink(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication); // Open in external browser like Chrome
    } else {
      throw 'Could not launch $url';
    }
  }
}
