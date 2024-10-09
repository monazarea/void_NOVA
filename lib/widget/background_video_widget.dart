import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BackgroundVideoWidget extends StatefulWidget {
  const BackgroundVideoWidget({super.key});

  @override
  State<BackgroundVideoWidget> createState() => _BackgroundVideoWidgetState();
}

class _BackgroundVideoWidgetState extends State<BackgroundVideoWidget> {
  late final VideoPlayerController videoController;
  @override
  void initState() {
    videoController = VideoPlayerController.asset('assets/videos/vid1.mp4')
      ..initialize().then((_) {
        videoController.play();
        videoController.setLooping(true);
      });
    super.initState();
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => VideoPlayer(videoController);
}