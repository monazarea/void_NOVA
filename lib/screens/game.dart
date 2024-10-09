import 'package:flutter/services.dart';

class UnityLauncher {
  static const platform = MethodChannel('com.example.void_nova/unity');

  Future<void> launchUnity() async {
    try {
      await platform.invokeMethod('launchUnity');
    } on PlatformException catch (e) {
      print("Failed to launch Unity APK: '${e.message}'.");
    }
  }
}
