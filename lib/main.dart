import 'package:flutter/material.dart';
import 'package:test_indraco/pages/api.dart';
import 'package:test_indraco/pages/awal_page.dart';
import 'package:test_indraco/pages/camera_page.dart';
import 'package:test_indraco/pages/input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => AwalPage(),
          '/api': (context) => ApiPage(),
          '/input': (context) => InputPage(),
          '/camera': (context) => CameraPage(),
        },
      ),
    );
  }
}
