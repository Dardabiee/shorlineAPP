import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:shorline_app/home_screen.dart';
void main() {
  runApp(
    DevicePreview(
    enabled: true,
    builder: (context) => MyApp()
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: HomeScreen()
    );
  }
}
