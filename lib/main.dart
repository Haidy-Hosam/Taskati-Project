import 'package:flutter/material.dart';
import 'package:taskati/app.dart';

Future<void> main() async {
  runApp(
    DevicePreview(
    enabeled : !KDebugMode,builder: (context) => const MainApp(),
  ));
}
