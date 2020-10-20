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
      title: 'Bringoo',
      theme: ThemeProvider.themeData,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: NoScrollEffectBehavior(),
          child: child,
        );
      },
      home: LandingScreen(),
    );
  }
}

// disables scroll glow effect for entire application
class NoScrollEffectBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}