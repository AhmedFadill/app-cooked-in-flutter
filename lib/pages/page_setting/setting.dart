import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  cc(ico, String txt) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        elevation: 5,
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Icon(ico),
            const SizedBox(
              width: 20,
            ),
            Text(
              txt,
              style: const TextStyle(
                  fontFamily: "tajawal", fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  var importnt = const TextStyle(
      fontFamily: "tajawal", fontSize: 20, fontWeight: FontWeight.bold);
  var normal = const TextStyle(
      fontFamily: "tajawal", fontSize: 17, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("images/Problem solving-pana.png"),
              InkWell(
                  onTap: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    final a = prefs.getStringList("item1");
                    final b = prefs.getStringList("item2");
                    final c = prefs.getStringList("item3");
                    showModalBottomSheet(
                        context: context,
                        builder: (contex) {
                          return Container(
                            width: double.infinity,
                            child: Column(
                              children: [
                                const SizedBox(height: 30),
                                const Text(
                                  "الفطور",
                                  style: TextStyle(
                                      fontFamily: "tajawal",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "$a",
                                  style: const TextStyle(
                                      fontFamily: "tajawal", fontSize: 20),
                                ),
                                const SizedBox(height: 40),
                                const Text(
                                  "الغداء",
                                  style: TextStyle(
                                      fontFamily: "tajawal",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "$b",
                                  style: const TextStyle(
                                      fontFamily: "tajawal", fontSize: 20),
                                ),
                                const SizedBox(height: 40),
                                const Text(
                                  "العشاء",
                                  style: TextStyle(
                                      fontFamily: "tajawal",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "$c",
                                  style: const TextStyle(
                                      fontFamily: "tajawal", fontSize: 20),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  child: cc(Icons.display_settings_rounded,
                      "عرض قوائم الطعام المسجلة")),
              InkWell(
                onTap: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  // ignore: use_build_context_synchronously
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                            title: const Text("حذف جميع القوائم",
                                style: TextStyle(fontFamily: "tajawal"),
                                textAlign: TextAlign.right),
                            content: const Text(
                                "هل انت متأكد من حذف جميع القوائم ؟",
                                style: TextStyle(fontFamily: "tajawal"),
                                textAlign: TextAlign.right),
                            actions: [
                              TextButton(
                                  onPressed: () async {
                                    await prefs.setStringList("item1", []);
                                    await prefs.setStringList("item2", []);
                                    await prefs.setStringList("item3", []);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                            behavior: SnackBarBehavior.floating,
                                            backgroundColor: Colors.red,
                                            content: Text(
                                              "تم المسح!",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                  fontFamily: "tajawal",
                                                  fontWeight: FontWeight.bold),
                                            )));
                                    Navigator.pop(context);
                                  },
                                  child: const Text("نعم",
                                      style: TextStyle(fontFamily: "tajawal"))),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("لا اشاقة",
                                      style: TextStyle(fontFamily: "tajawal")))
                            ]);
                      });
                },
                child: cc(Icons.delete_outline_outlined,
                    "حذف كل قوائم الطعام المسجلة"),
              ),
              InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (contex) {
                          return SingleChildScrollView(
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  const SizedBox(height: 30),
                                  Text(
                                    "تطبيق يساعدك يومياً في اختيار اكلة من بين مجموعة من الاكلات التي تفضلها",
                                    style: normal,
                                    textAlign: TextAlign.right,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "كيف يعمل -",
                                    style: importnt,
                                    textAlign: TextAlign.right,
                                  ),
                                  Text(
                                    "يأخذ التطبيق مجموعة الاكلات التي تدخلها ويخزنها في ذاكرة الجهاز الخاص بك ويعمل على اعطاء نتيجة مختلفة في كل مره تختار فيها طبق",
                                    style: normal,
                                    textAlign: TextAlign.right,
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    "اشياء يجب مراعاتها -",
                                    style: importnt,
                                    textAlign: TextAlign.right,
                                  ),
                                  Text(
                                    "عند الادخال يجب ان تدخل قائمة الاكل كاملة وليس فقط اكله واحدة ويجب ان تفصل كل اكلة بفارزة ولا تنسى اختبار هل القائمة للفطور او الغداء او العشاء",
                                    style: normal,
                                    textAlign: TextAlign.right,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ListTile(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) {
                                            return AlertDialog(
                                              title: const Text(
                                                "ما مهتم",
                                                textAlign: TextAlign.center,
                                              ),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text("نعتذر"))
                                              ],
                                            );
                                          });
                                    },
                                    title: const Text(
                                      "اضغطو هنا لمشاركة رأيكم",
                                      style: TextStyle(
                                          fontFamily: "tajawal",
                                          decoration: TextDecoration.underline),
                                      textAlign: TextAlign.right,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: cc(
                      Icons.info_outline_rounded, "معلومات مفيدة عن التطبيق")),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "للتواصل",
                style: TextStyle(
                    fontFamily: "tajawal", fontWeight: FontWeight.bold),
              ),
              const Divider(
                indent: 85,
                endIndent: 85,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          elevation: MaterialStatePropertyAll(0),
                          padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                      onPressed: () async {
                        if (await canLaunchUrl(
                            Uri.parse('https://t.me/Stage3_CS'))) {
                          await launchUrl(Uri.parse('https://t.me/Stage3_CS'),
                              mode: LaunchMode.externalApplication);
                        } else {
                          throw 'Could not launch ${Uri.parse('https://t.me/Stage3_CS')}';
                        }
                      },
                      child: Image.asset(
                        "images/2111646.png",
                        fit: BoxFit.contain,
                        height: 50,
                        width: 30,
                      )),
                  const SizedBox(width: 20),
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          elevation: MaterialStatePropertyAll(0),
                          padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                      onPressed: () async {
                        if (await canLaunchUrl(Uri.parse(
                            'https://www.instagram.com/mk._sm?utm_source=qr&igsh=NXJndXhoc2NreHoz'))) {
                          await launchUrl(
                              Uri.parse(
                                  'https://www.instagram.com/mk._sm?utm_source=qr&igsh=NXJndXhoc2NreHoz'),
                              mode: LaunchMode.externalApplication);
                        } else {
                          throw 'Could not launch ${Uri.parse('https://www.instagram.com/mk._sm?utm_source=qr&igsh=NXJndXhoc2NreHoz')}';
                        }
                      },
                      child: Image.asset(
                        "images/instagram-icon-logo-free-png.png",
                        fit: BoxFit.contain,
                        height: 50,
                        width: 30,
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          elevation: MaterialStatePropertyAll(0),
                          padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                      onPressed: () async {
                        if (await canLaunchUrl(
                            Uri.parse('https://github.com/AhmedFadill'))) {
                          await launchUrl(
                              Uri.parse('https://github.com/AhmedFadill'),
                              mode: LaunchMode.externalApplication);
                        } else {
                          throw 'Could not launch ${Uri.parse('https://github.com/AhmedFadill')}';
                        }
                      },
                      child: Image.asset(
                        "images/1608907_github_square_icon.png",
                        fit: BoxFit.contain,
                        height: 50,
                        width: 30,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
