import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    Future.delayed(const Duration(milliseconds: 1750), () async {
      // Delay for 3 seconds
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? isFirstTime = prefs.getBool('isFirstTime');
      if (isFirstTime == null) {
        prefs.setBool("isFirstTime", true);
        Navigator.pushReplacementNamed(context, '/intro');
      } // Navigate to home screen
      else {
        Navigator.pushReplacementNamed(context, '/primary');
      }
      FlutterNativeSplash.remove(); // Remove splash screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            height: double.infinity,
            color: Colors.white,
            child: Image.asset('images/Hamburger.gif')),
      ),
    );
  }
}
