import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

// ignore: camel_case_types
class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

// ignore: camel_case_types
class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState() {
    // Use initState for splash duration
    super.initState();
    Future.delayed(const Duration(milliseconds: 1750), () {
      // Delay for 3 seconds
      Navigator.pushReplacementNamed(
          context, '/intro'); // Navigate to home screen
      FlutterNativeSplash.remove(); // Remove splash screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('images/Hamburger.gif'),
      ),
    );
  }
}
