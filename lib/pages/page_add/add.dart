import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  String DropdownButtonValue = "فطور";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset("images/pexels-vojtech-okenka-1055272.jpg"),
                  Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "اضف قائمة طعام يمكنك تحضيرها",
                        style: GoogleFonts.tajawal(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        hintText: "... تمن وقيمة , بتيتة وبيض , ريزو ",
                        label: Text("قائمة الاكلات"),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        focusColor: Colors.amber,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ))),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButton(
                      value: DropdownButtonValue,
                      padding: EdgeInsets.all(0),
                      isExpanded: true,
                      underline: SizedBox(),
                      items: const [
                        DropdownMenuItem(
                          value: "فطور",
                          child: Text(
                            "فطور",
                          ),
                          alignment: Alignment.center,
                        ),
                        DropdownMenuItem(
                          value: "غداء",
                          child: Text("غداء"),
                          alignment: Alignment.center,
                        ),
                        DropdownMenuItem(
                          value: "عشاء",
                          child: Text("عشاء"),
                          alignment: Alignment.center,
                        ),
                      ],
                      onChanged: (String? newv) {
                        setState(() {
                          DropdownButtonValue = newv!;
                        });
                      }),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.red[500]),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Text(
                  "اضف القائمة",
                  style: GoogleFonts.tajawal(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
