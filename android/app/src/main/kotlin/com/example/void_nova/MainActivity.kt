package com.example.void_nova

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.void_nova/unity" // Define your channel name

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "launchUnity") {
                val launchIntent = packageManager.getLaunchIntentForPackage("com.unity.template.nova")
                if (launchIntent != null) {
                    startActivity(launchIntent)
                    result.success(null) // Respond with success
                } else {
                    result.error("UNAVAILABLE", "Unity APK not found", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }
}
