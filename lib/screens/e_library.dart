import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';


import '../widget/back.dart';

class ELibrary extends StatelessWidget {
  // Sample data for books
  final List<Map<String, String>> books = [
    {
      'title': 'ABCs of Exoplanets Book',
      'image': 'images/ABCs of Exoplanets Book.png', // Replace with your image path
      'downloadLink': 'https://www.nasa.gov/wp-content/uploads/2020/12/not_yet_imagined_tagged.pdf?emrc=ce2a67',
    },
    {
      'title': 'Hubble Focus – Exoplanets',
      'image': 'images/Hubble Focus – Exoplanets.png',
      'downloadLink': 'https://www.nasa.gov/wp-content/uploads/2023/02/607087main_NASAsFirst50YearsHistoricalPerspectives-ebook.pdf?emrc=3e2a2a',
    },
    {
      'title': "Nasa's First 50 Years",
      'image': "images/Nasa's First 50 Years.png",
      'downloadLink': 'https://www.nasa.gov/wp-content/uploads/2023/02/607087main_NASAsFirst50YearsHistoricalPerspectives-ebook.pdf?emrc=3e2a2a',
    },
    {
      'title': 'Not Yet Imagined Book 4',
      'image': 'images/Not Yet Imagined.png',
      'downloadLink': 'https://example.com/book4.pdf',
    },
  ];

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
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      return _buildBookCard(context, books[index]);
                    },
                  ),
                ),
              ],
            ),
          ),

          const Positioned(
            top: 10,  // Adjust the position of the button from the bottom
            right: 20,   // Adjust the position of the button from the right
            child: BackButtonWidget(),
          ),
        ],
      ),
    );
  }

  Widget _buildBookCard(BuildContext context, Map<String, String> book) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.only(right: 16.0),
      color:Colors.transparent,
      child: Container(
        width: 250, // Set the card width
        height: 300, // Set the card height
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
              offset: Offset(0.0, 0.0),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  book['image']!,
                  fit: BoxFit.cover, // Adjust image fit
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(

              book['title']!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'fam1',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _openBookLink(book['downloadLink']!);
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
                'Download',
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
