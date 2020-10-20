import 'package:bringoo_test/theme.dart';
import 'package:bringoo_test/ui/landing.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeProvider.themeData,
      home: LandingScreen(),
    );
  }
}
