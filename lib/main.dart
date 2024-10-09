import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:void_nova/deeplinks.dart';
import 'package:void_nova/screens/first_screen.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  // Hide the status and navigation bars for full-screen mode
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final AppLinksDeepLink _appLinksDeepLink = AppLinksDeepLink.instance; // Initialize AppLinksDeepLink instance


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _appLinksDeepLink.initDeepLinks(); // Initialize deep links when the app starts


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );

  }
}
