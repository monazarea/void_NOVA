import 'package:flutter/material.dart';
import 'package:void_nova/screens/e_library.dart';
import 'package:void_nova/screens/eyes_on_nasa.dart';
import 'package:void_nova/screens/galary.dart';
import 'package:void_nova/screens/quizzes.dart';
import 'package:void_nova/screens/story.dart';
import '../widget/back.dart';

class LearningScreen extends StatelessWidget {
  const LearningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'images/g33.gif',
              fit: BoxFit.cover,
            ),
          ),
          OrientationBuilder(
            builder: (context, orientation) {
              bool isLandscape = orientation == Orientation.landscape;
              return GridView.count(
                crossAxisCount: isLandscape ? 3 : 2, // Adjust based on orientation
                padding: const EdgeInsets.all(16.0),
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: [
                  _buildCard(context, "Eyes on Exoplanets", 'images/eyes.png'),
                  _buildCard(context, "Story about Exoplanets", 'images/story.png'),
                  _buildCard(context, "E-Library", 'images/library.png'),
                  _buildCard(context, "Gallery", 'images/gallery.png'),
                  _buildCard(context, "Quizzes", 'images/quizz.png'),
                ],
              );
            },
          ),
          const Positioned(
            bottom: 20,
            right: 20,
            child: BackButtonWidget(),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, String img) {
    return InkWell(
      onTap: () {
        _handleCardTap(context, title);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.lightBlue.withOpacity(.8),
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.lightBlueAccent.withOpacity(.1),
              blurRadius: 15,
              offset: Offset(0, 10),
              spreadRadius: 5,
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 160,
              child: Image.asset(img),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'fam1',
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleCardTap(BuildContext context, String title) {
    switch (title) {
      case 'Eyes on Exoplanets':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EyesOnNasa()),
        );
        break;
      case 'Story about Exoplanets':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  Story()),
        );
        break;
      case 'E-Library':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ELibrary()),
        );
        break;
      case 'Gallery':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Gallery()),
        );
        break;
      case 'Quizzes':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QuizSelectionScreen()
        ));
        break;
      default:
        break;
    }
  }
}
