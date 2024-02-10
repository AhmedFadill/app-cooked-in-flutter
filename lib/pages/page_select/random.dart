import 'package:flutter/material.dart';

class Random extends StatefulWidget {
  const Random({super.key, this.food});
  final food;
  @override
  State<Random> createState() => _RandomState(food);
}

class _RandomState extends State<Random> {
  _RandomState(this.food);
  var food;
  bool showtext = false;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        showtext = true;
      });
    });
  }

  Widget build(BuildContext context) {
    return showtext == false
        ? AlertDialog(
            backgroundColor: Colors.transparent,
            content: const Text(
              "...انتظر قليلاً",
              style: TextStyle(
                  fontFamily: "tajawal",
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            title: Image.asset("images/pc8Oi1SZ1CsL1T15I8.gif"),
            actions: const [],
          )
        : AlertDialog(
            content: Text(
              "$food",
              style: const TextStyle(
                  fontFamily: "tajawal",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
              textAlign: TextAlign.center,
            ),
            title: const Text(
              "اكلة اليوم هي",
              style: TextStyle(
                  fontFamily: "tajawal",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
            actions: const []);
  }
}
