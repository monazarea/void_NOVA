import 'package:flutter/material.dart';

import '../widget/back.dart';

// Question class
class Question {
  final String questionText;
  final List<String> options;
  final String correctAnswer;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswer,
  });
}

// Quiz class
class Quiz {
  final String title;
  final List<Question> questions;

  Quiz({
    required this.title,
    required this.questions,
  });
}


// Example quiz data
List<Quiz> quizzes = [
  Quiz(
    title: 'Quiz 1 (What is an Exoplanet!)',
    questions: [
      Question(
        questionText: 'What is an exoplanet?',
        options: ['A planet in our solar system', 'A planet beyond our solar system', 'A moon orbiting Earth'],
        correctAnswer: 'A planet beyond our solar system',
      ),
      Question(
        questionText: 'What are rogue planets?',
        options: ['Planets that orbit multiple stars', ' Planets with no star', 'Planets that orbit within our solar system'],
        correctAnswer: 'Planets with no star',
      ),
      Question(
        questionText: 'How many exoplanets have been confirmed?',
        options: ['Less than 1,000', 'Around 5,600', 'Over 10,000'],
        correctAnswer: ' Around 5,600',
      ),
    ],
  ),
  Quiz(
    title: 'Quiz 2 (goals of NASA’s Exoplanet Exploration Program)',
    questions: [
      Question(
        questionText: 'How many stars are estimated to be in the Milky Way galaxy?',
        options: ['100 million', '100 billion', '10 trillion'],
        correctAnswer: '100 billion',
      ),
      Question(
        questionText: 'Which star is our nearest neighboring star that has at least one exoplanet?',
        options: ['Proxima Centauri', 'Sirius', 'Betelgeuse'],
        correctAnswer: 'Proxima Centauri',
      ),
      Question(
        questionText: 'How far away is Proxima Centauri from Earth?',
        options: ['1 light-year', '4 light-years', '10 light-years'],
        correctAnswer: 'Blue',
      ),
    ],
  ),
  Quiz(
    title: 'Quiz 3 (A galaxy of stars – and planets)',
    questions: [
      Question(
        questionText: 'What does the Exoplanet Exploration Program (ExEP) primarily focus on?',
        options: ['Exploring Mars', 'Discovery and understanding of planetary systems around nearby stars', 'Studying black holes'],
        correctAnswer: 'Discovery and understanding of planetary systems around nearby stars',
      ),
      Question(
        questionText: 'Which organization is responsible for the Exoplanet Exploration Program (ExEP)?',
        options: ['European Space Agency (ESA)', 'National Aeronautics and Space Administration (NASA)', 'Russian Space Agency (ROSCOSMOS)'],
        correctAnswer: ' National Aeronautics and Space Administration (NASA)',
      ),
      Question(
        questionText: 'What role does ExEP serve within the science community?',
        options: ['It focuses solely on theoretical research', 't acts as a focal point for exoplanet science and technology.', 'It primarily funds space missions.'],
        correctAnswer: 'It acts as a focal point for exoplanet science and technology.',
      ),
    ],
  ),
  Quiz(
    title: 'Quiz 4 (Types of exoplanets)',
    questions: [
      Question(
        questionText: 'What is the capital of France?',
        options: ['Paris', 'London', 'Berlin'],
        correctAnswer: 'Paris',
      ),
      Question(
        questionText: 'What is 2 + 2?',
        options: ['3', '4', '5'],
        correctAnswer: '4',
      ),
      Question(
        questionText: 'What is the color of the sky?',
        options: ['Blue', 'Green', 'Red'],
        correctAnswer: 'Blue',
      ),
    ],
  ),
  Quiz(
    title: 'Quiz 5 (Exoplanet discovery – and mystery)',
    questions: [
      Question(
        questionText: 'What year is considered the watershed year for the discovery of exoplanets?',
        options: ['1990', '1995', '2000'],
        correctAnswer: '1995',
      ),
      Question(
        questionText: 'What is the classification of the first exoplanet to gain significant attention?',
        options: ['Rocky planet', 'Hot Jupiter', 'Ice giant'],
        correctAnswer: 'Hot Jupiter',
      ),
      Question(
        questionText: 'How far is 51 Pegasi b from Earth?',
        options: ['25 light-years', '50 light-years', '100 light-years'],
        correctAnswer: '50 light-years',
      ),

    ],
  ),
  Quiz(
    title: 'Quiz 5 (5 Ways to Find a Planet)',
    questions: [
      Question(
        questionText: 'What year is considered the watershed year for the discovery of exoplanets?',
        options: ['1990', '1995', '2000'],
        correctAnswer: '1995',
      ),
      Question(
        questionText: 'What is the classification of the first exoplanet to gain significant attention?',
        options: ['Rocky planet', 'Hot Jupiter', 'Ice giant'],
        correctAnswer: 'Hot Jupiter',
      ),
      Question(
        questionText: 'How far is 51 Pegasi b from Earth?',
        options: ['25 light-years', '50 light-years', '100 light-years'],
        correctAnswer: '50 light-years',
      ),

    ],
  ),
  Quiz(
    title: 'Quiz 5 (Future of Exoplanet Research)',
    questions: [
      Question(
        questionText: 'What year is considered the watershed year for the discovery of exoplanets?',
        options: ['1990', '1995', '2000'],
        correctAnswer: '1995',
      ),
      Question(
        questionText: 'What is the classification of the first exoplanet to gain significant attention?',
        options: ['Rocky planet', 'Hot Jupiter', 'Ice giant'],
        correctAnswer: 'Hot Jupiter',
      ),
      Question(
        questionText: 'How far is 51 Pegasi b from Earth?',
        options: ['25 light-years', '50 light-years', '100 light-years'],
        correctAnswer: '50 light-years',
      ),

    ],
  ),

];

class QuizSelectionScreen extends StatelessWidget {
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
          Column(
            children: [
              // Add space from the top
              SizedBox(height: 10), // Adjust as needed

              // Title in the middle
              Center(
                child: Text(
                  'Select Quiz',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              // Space between the title and list
              SizedBox(height: 20),

              // Expanded widget for the ListView
              Expanded(
                child: ListView.builder(
                  itemCount: quizzes.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.lightBlueAccent.withOpacity(0.9),
                          width: 2.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueAccent.withOpacity(.3),
                            spreadRadius: 3,
                            blurRadius: 8,
                            offset: const Offset(0, 0),
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
                      child: ListTile(
                        title: Text(
                          quizzes[index].title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  QuizAndQuestionScreen(selectedQuiz: quizzes[index]),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const Positioned(
            top: 10,
            right: 20,
            child: BackButtonWidget(),
          ),
        ],
      ),
    );
  }
}

class QuizAndQuestionScreen extends StatefulWidget {
  final Quiz selectedQuiz;

  QuizAndQuestionScreen({required this.selectedQuiz});

  @override
  _QuizAndQuestionScreenState createState() => _QuizAndQuestionScreenState();
}

class _QuizAndQuestionScreenState extends State<QuizAndQuestionScreen> {
  Map<int, String> _selectedAnswers = {};
  int _score = 0;
  bool _showNextButton = false;
  bool _quizSubmitted = false;

  void _calculateScore() {
    int score = 0;
    widget.selectedQuiz.questions.asMap().forEach((index, question) {
      if (_selectedAnswers[index] == question.correctAnswer) {
        score++;
      }
    });

    setState(() {
      _score = score;
      _quizSubmitted = true;

      // Enable the Next button if score is greater than 1
      if (_score > 1) {
        _showNextButton = true;
      } else {
        _showNextButton = false;
      }
    });
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Quiz Result'),
        content: Text(
          'Your score: $_score/${widget.selectedQuiz.questions.length}',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

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
          SingleChildScrollView(
            child: Column(
              children: [
                // Title
                SizedBox(height: 40),
                Center(
                  child: Text(
                    widget.selectedQuiz.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Show questions of the selected quiz
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.selectedQuiz.questions.length,
                  itemBuilder: (context, index) {
                    Question question = widget.selectedQuiz.questions[index];
                    return ListTile(
                      title: Text(
                        question.questionText,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Column(
                        children: question.options
                            .map(
                              (option) => RadioListTile<String>(
                            title: Text(
                              option,
                              style: TextStyle(color: Colors.white),
                            ),
                            value: option,
                            groupValue: _selectedAnswers[index],
                            onChanged: (value) {
                              setState(() {
                                _selectedAnswers[index] = value!;
                              });
                            },
                          ),
                        )
                            .toList(),
                      ),
                    );
                  },
                ),

                // Submit Button
                SizedBox(height: 20),
                ElevatedButton(
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
                  onPressed: () {
                    _calculateScore();
                    _showResultDialog();
                  },
                  child: Text('Submit'),
                ),

                // Next Button (Only shows if score > 1)
                SizedBox(height: 20),
                ElevatedButton(
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
                  onPressed: _showNextButton ? () {
                    // Navigate to the next quiz or action
                  } : null,
                  child: Text('Next'),
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 10,
            right: 20,
            child: BackButtonWidget(),
          ),],
      ),
    );
  }
}