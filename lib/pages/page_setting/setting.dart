import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      height: 80,
      child: Card(
        margin: const EdgeInsets.all(10),
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
              style: GoogleFonts.tajawal(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  var importnt = GoogleFonts.tajawal(fontSize: 20, fontWeight: FontWeight.bold);
  var normal = GoogleFonts.tajawal(fontSize: 17, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                              Text(
                                "الفطور",
                                style: GoogleFonts.tajawal(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "$a",
                                style: GoogleFonts.tajawal(fontSize: 20),
                              ),
                              const SizedBox(height: 40),
                              Text(
                                "الغداء",
                                style: GoogleFonts.tajawal(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "$b",
                                style: GoogleFonts.tajawal(fontSize: 20),
                              ),
                              const SizedBox(height: 40),
                              Text(
                                "العشاء",
                                style: GoogleFonts.tajawal(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "$c",
                                style: GoogleFonts.tajawal(fontSize: 20),
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: cc(Icons.display_settings_rounded,
                    "عرض قوائم الطعام المسجلة")),
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
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("نعتذر"))
                                            ],
                                          );
                                        });
                                  },
                                  title: Text(
                                    "اضغطو هنا لمشاركة رأيكم",
                                    style: GoogleFonts.tajawal(
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
                child:
                    cc(Icons.info_outline_rounded, "معلومات مفيدة عن التطبيق")),
            const SizedBox(
              height: 30,
            ),
            Text(
              "للتواصل",
              style: GoogleFonts.tajawal(fontWeight: FontWeight.bold),
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
    );
  }
}
