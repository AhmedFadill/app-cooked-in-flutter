import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Introdacion extends StatefulWidget {
  const Introdacion({super.key});

  @override
  State<Introdacion> createState() => _IntrodacionState();
}

class _IntrodacionState extends State<Introdacion> {
  List<PageViewModel> pages = [
    PageViewModel(
      title: "تطبيق طبخاتي",
      body:
          "يساعدك على تقليل وقت التفكير بطبخة اليوم والتخلص من اراء البعض العديمة للذوق من خلال اقتراح طبخة من الطبخات التي تعجبك",
      image: Center(child: Image.asset('images/Choice-pana.png')),
    ),
    PageViewModel(
      title: "الخطوة الاولى",
      body:
          "حدد اكلاتك المفضلة والتي تستطيع عملها لكل من الفطور والغداء والعشاء",
      image: Center(child: Image.asset('images/Order food-pana.png')),
    ),
    PageViewModel(
      title: "الخطوة الثانية",
      body: "حدد توقيت الاكل المطلوب مثلاً فطور او غداء او عشاء",
      image: Center(
        child: Image.asset('images/Lunch time-cuate.png'),
      ),
    ),
    PageViewModel(
      title: "اخيراً",
      body: "بالعافية",
      image: Center(child: Image.asset('images/Recipe book.gif')),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          bodyPadding: EdgeInsets.only(top: 50),
          pages: pages,
          done: const Text("done"),
          next: const Text("next"),
          back: const Text("back"),
          skip: const Text("skip"),
          onSkip: () => Navigator.pushReplacementNamed(context, '/primary'),
          onDone: () {
            Navigator.pushReplacementNamed(context, '/primary');
          },
          showNextButton: true,
          showBackButton: true,
        ),
      ),
    );
  }
}
