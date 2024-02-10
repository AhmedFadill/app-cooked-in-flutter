// ignore_for_file: use_build_context_synchronously


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  String DropdownButtonValue = "فطور";
  TextEditingController controller1 = TextEditingController();
  var data = {'فطور': [], 'غداء': [], 'عشاء': []};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset("images/pexels-vojtech-okenka-1055272.jpg"), //
                  Column(
                    children: [
                      const SizedBox(
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                    controller: controller1,
                    onChanged: (value) =>
                        print("controller1${controller1.text}"),
                    textAlign: TextAlign.right,
                    decoration: const InputDecoration(
                        hintText: "... تمن وقيمة ، بتيتة وبيض ، ريزو ",
                        label: Text(
                          "قائمة الاكلات",
                          style: TextStyle(),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        focusColor: Colors.amber,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ))),
              ),
              const SizedBox(
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
                      padding: const EdgeInsets.all(0),
                      isExpanded: true,
                      underline: const SizedBox(),
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
                          print(DropdownButtonValue);
                        });
                      }),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                " ، يجب اضافة قائمة طعام كاملة وتأكد ان تفصل كل اكلة بفارزة",
                style: GoogleFonts.tajawal(
                    fontSize: 13, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (controller1.text != "") {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    DropdownButtonValue == "فطور"
                        ? await prefs.setStringList(
                            "item1", controller1.text.split("،"))
                        : DropdownButtonValue == "غداء"
                            ? await prefs.setStringList(
                                "item2", controller1.text.split("،"))
                            : await prefs.setStringList(
                                "item3", controller1.text.split("،"));
                    final a = prefs.getStringList("item1");
                    print(a);
                    controller1.clear();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                      "تم الحفظ!",
                      textAlign: TextAlign.right,
                    )));
                  } else {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: const Text("القائمة فارغة"),
                              content: const Text('يجب اضافة قائمة طعام'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("اسف"))
                              ],
                            ));
                  }
                },
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
