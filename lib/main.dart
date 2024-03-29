import 'package:flutter/material.dart';
import 'package:you_cooked/pages/introdaction.dart';
import 'package:you_cooked/pages/page_add/add.dart';
import 'package:you_cooked/pages/page_select/primary.dart';
import 'package:you_cooked/pages/splash.dart';

void main() => runApp(const Index());

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "tajawal", useMaterial3: true),
      routes: {
        '/': (context) => const Splash_screen(),
        '/intro': (context) => const Introdacion(),
        '/primary': (context) => const Primary(),
        '/Add': (context) => const Add(),
      },
    );
  }
}
