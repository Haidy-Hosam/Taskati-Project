import 'package:flutter/material.dart';
import 'package:taskati/app.dart';
import 'package:device_preview/device_preview.dart';

Future<void> main() async {
  runApp(
    DevicePreview(
      // enabled:!kDebugMode, 
      builder: (context) => const MainApp(),
    ),
  );
}
