import 'package:flutter/material.dart';

import '../widget/back.dart';

class TopicDetailScreen extends StatefulWidget {
  final String topic;

  // Constructor to receive the selected topic
  TopicDetailScreen({required this.topic});

  @override
  _TopicDetailScreenState createState() => _TopicDetailScreenState();
}

class _TopicDetailScreenState extends State<TopicDetailScreen> {
  // Placeholder content for each topic
  final Map<String, String> topicDetails = {
    'ًWhat is an Exoplanet!?': 'An exoplanet is any planet beyond our solar system. Most of them orbit other stars, but some free-floating exoplanets, called rogue planets, are untethered to any star. We’ve confirmed more than 5,600 exoplanets out of the billions that we believe exist...',
    'A galaxy of stars – and planets': '''Our galaxy, the Milky Way, is the thick stream of stars that cuts across the sky on the darkest, clearest nights. Its spiraling expanse contains at least 100 billion stars, our Sun among them. And if each of those stars has not just one planet, but, like ours, a whole system of them, then the number of planets in the galaxy is truly astronomical: We’re already heading into the trillions.

We humans have been speculating about such possibilities for thousands of years, but ours is the first generation to know, with certainty, that exoplanets are really out there. In fact, way out there. Our nearest neighboring star, Proxima Centauri, was found to possess at least one planet – probably a rocky one. It’s about 4 light-years away – more than 25 trillion miles (40 trillion kilometers). The bulk of exoplanets found so far are hundreds or thousands of light-years away.

The bad news: As yet we have no way to reach them, and won’t be leaving footprints on them anytime soon. The good news: We can look in on them, take their temperatures, taste their atmospheres and, perhaps one day soon, detect signs of life that might be hidden in pixels of light captured from these dim, distant worlds...''',
    'goals of NASA’s Exoplanet Exploration Program':'The Exoplanet Exploration Program (ExEP) is responsible for implementing NASA’s plans for the discovery and understanding of planetary systems around nearby stars. ExEP serves the science community and NASA by acting a as focal point for exoplanet science and technology, and by the integration of cohesive strategies for future discoveries.',
    'Exoplanet discovery – and mystery': '''The first exoplanets were discovered in the early 1990s, but the first exoplanet to burst upon the world stage was 51 Pegasi b, a “hot Jupiter” orbiting a Sun-like star 50 light-years away. The watershed year was 1995. Since then we’ve discovered thousands more.

Size and mass play a crucial role in determining planet types. There are also varieties within the size/mass classifications. Scientists also have noted what seems to be a strange gap in planet sizes. It’s been dubbed the “radius valley,” or the Fulton gap, after Benjamin Fulton, lead author on a paper describing it. Data from NASA’s Kepler spacecraft showed that planets of a certain size-range are rare – those between 1.5 and 2 times the size (diameter) of Earth, which would place them among the super-Earths. It’s possible that this represents a critical size in planet formation: Planets that reach this size quickly attract thick atmospheres of hydrogen and helium gas, and balloon up into gaseous planets, while planets smaller than this limit are not large enough to hold such an atmosphere and remain primarily rocky, terrestrial bodies. On the other hand, the smaller planets that orbit close to their stars could be the cores of Neptune-like worlds that had their atmospheres stripped away...''',
    "Types of exoplanets": '''Each planet type varies in interior and exterior appearance depending on composition.

Gas giants are planets the size of Saturn or Jupiter, the largest planet in our solar system, or much, much larger.

More variety is hidden within these broad categories. Hot Jupiters, for instance, were among the first planet types found – gas giants orbiting so closely to their stars that their temperatures soar into the thousands of degrees (Fahrenheit or Celsius).

Neptunian planets are similar in size to Neptune or Uranus in our solar system. They likely have a mixture of interior compositions, but all will have hydrogen and helium-dominated outer atmospheres and rocky cores. We’re also discovering mini-Neptunes, planets smaller than Neptune and bigger than Earth. No planets of this size or type exist in our solar system.

Super-Earths are typically terrestrial planets that may or may not have atmospheres. They are more massive than Earth, but lighter than Neptune.

Terrestrial planets are Earth sized and smaller, composed of rock, silicate, water or carbon. Further investigation will determine whether some of them possess atmospheres, oceans or other signs of habitability.''',
    'Challenges in Exoplanet Exploration': 'Exploring exoplanets is difficult due to their vast distances and faint signals...',
    'Future of Exoplanet Research': "The future study of Earth-like planets around other stars will require advances in several key space technologies. Broadly speaking, these challenges lie in the areas of high-angular-resolution sensing and high-contrast imaging, and in improvements to the stability of space telescopes. Such space observatories might take many forms; mission concepts studied so far include designs based on coronagraphs, starshades and various hybrid designs. These approaches use wavefront sensing and control, advanced optics and state-of-the-art structures, materials and mechanisms, and require specialized spacecraft subsystems. Starshades require the coordinated use of multiple spacecraft and will rely on new guidance, navigation, and control algorithms. In all of these cases, fully testing these observatories on the ground, prior to launch, will be challenging, and careful attention to methods of verification and validation will be critical to mission success.",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/g33.gif'), // Replace with your background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Centered text container with lighting border effect
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.purpleAccent.withOpacity(0.8), // Lighting effect
                  width: 4.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.7),
                    blurRadius: 12,
                    spreadRadius: 5,
                    offset: Offset(0, 0), // Lighting border shadow effect
                  ),
                ],
                color: Colors.black54, // Semi-transparent background for text container
              ),
              child: SingleChildScrollView(
                child: Text(
                  topicDetails[widget.topic] ?? 'No details available for this topic.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 20,  // Adjust the position of the button from the bottom
            right: 20,   // Adjust the position of the button from the right
            child: BackButtonWidget(),
          ),
        ],
      ),
    );
  }
}
