import 'package:flutter/material.dart';
import 'package:void_nova/screens/galary.dart';
import 'package:void_nova/screens/quizzes.dart';
import 'package:void_nova/screens/topicdetail5ways.dart';
import '../widget/back.dart';
import 'DetailScreen.dart';

class Story extends StatelessWidget {
  // List of topics
  final List<String> topics = [
    'What is an Exoplanet!',
    'goals of NASA’s Exoplanet Exploration Program',
    'A galaxy of stars – and planets',
    'Types of exoplanets',
    'Exoplanet discovery – and mystery',
    '5 Ways to Find a Planet',
    'Future of Exoplanet Research',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'images/g33.gif',
              fit: BoxFit.cover,
            ),
          ),
          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),  // Adjust space above 'STORY' text
                const Text(
                  'STORY',
                  style: TextStyle(
                    fontFamily: 'fam1',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 0),  // Adjust the spacing under 'STORY'
                SizedBox(
                  height: 300,
                  child: Expanded(
                    // Wrap ListView.builder in Expanded to fit inside Column
                    child: ListView.builder(
                      itemCount: topics.length,
                      itemBuilder: (context, index) {
                        return _buildLightingTopicCard(context, topics[index]);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 20,  // Adjust the position of the button from the bottom
            right: 20,   // Adjust the position of the button from the right
            child: BackButtonWidget(),
          ),
          Positioned(
            top: 10,  // Adjust the position of the button from the bottom
            right: 20,   // Adjust the position of the button from the right
            child: QuizSelectionScreen()
          ),
        ],
      ),
    );
  }

  Widget _buildLightingTopicCard(BuildContext context, String topic) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () {
          if(topic!='5 Ways to Find a Planet') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TopicDetailScreen(topic: topic),
              ),
            );
          }
          else{
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TopicDetail5Ways()
              ),
            );
          }
        },
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.lightBlueAccent.withOpacity(0.9), // Light border color
                width: 2.0, // Border width
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent.withOpacity(.3),
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
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  topic,
                  style: const TextStyle(
                    fontFamily: 'fam1',
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

