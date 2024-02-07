import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:you_cooked/pages/page_add/add.dart';
import 'package:you_cooked/pages/page_select/data.dart';

class Primary extends StatefulWidget {
  const Primary({super.key});

  @override
  State<Primary> createState() => _PrimaryState();
}

class _PrimaryState extends State<Primary> {
  // Widget gen_item(img,txt){
  //   return Column(
  //     children: [
  //       Image.asset(img,height: 350,width: 350,),
  //       Text(txt)
  //     ],
  //   );
  // }
  List<prodect> prodct = [
    prodect('images/png-clipart-food-fried-food-food-delicatessen.png', "فطور"),
    prodect('images/pngtree-charcoal-biryani-free-psd-png-image_9122563.png',
        "غداء"),
    prodect('images/dinner.png', "عشاء"),
  ];
  @override
  int indox = 0;
  int index_circt = 0;
  BottomNavigationBarItem bott(ico, labl) {
    return BottomNavigationBarItem(
      icon: ico,
      label: labl,
    );
  }

  bool showImge = true;
  bool showText = false;
  void tim() {
    Future.delayed(Duration(milliseconds: 400),(){
      setState(() {
        showImge!=showImge;
        showText!=showText;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            bott(Icon(Icons.home), "Home"),
            bott(Icon(Icons.add), "Add"),
            bott(Icon(Icons.settings), "setting")
          ],
          onTap: (value) => setState(() {
            indox = value;
          }),
          currentIndex: indox,
          selectedItemColor: Colors.red,
          selectedLabelStyle: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
          showUnselectedLabels: false,
        ),

        // const GNav(
        //   gap: 5,
        //   tabMargin: EdgeInsets.all(0),
        //   activeColor: Colors.white,
        //   tabBackgroundColor: Color.fromARGB(255, 243, 67, 54),
        //   tabBorderRadius: 20,
        //   tabs: [
        //   GButton(icon: Icons.home,text: "Home",),
        //   GButton(icon: Icons.add,text: "Add",),
        //   GButton(icon: Icons.settings,text:"Setting"),
        // ]),

        body: indox == 0
            ? Container(
                child: Column(
                  children: [
                    Container(
                        height: 150,
                        // decoration: const BoxDecoration(
                        //   color: Color(0xffA94438),
                        //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),
                        //   bottomRight: Radius.circular(15)),
                        // ),
                        child: SafeArea(
                            child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Food Menu",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.aBeeZee(
                                  color: Colors.red,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            Divider(
                              color: Colors.red[500],
                              thickness: 3,
                              indent: 75,
                              endIndent: 75,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "اختر الطبق الذي تريده",
                              style: GoogleFonts.tajawal(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ))),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(Icons.keyboard_double_arrow_left_sharp),
                        Text(
                          "يمكنك التمرير لليسار واليمين",
                          style: GoogleFonts.tajawal(fontSize: 18),
                        ),
                        const Icon(Icons.keyboard_double_arrow_right)
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 350,
                      child: ScrollSnapList(
                        itemBuilder: _buldListItem,
                        itemCount: prodct.length,
                        itemSize: 300,
                        onItemFocus: (index) {
                          setState(() {
                            index_circt = index;
                          });
                        },
                        dynamicItemSize: true,
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        index_circt == 0
                            ? const Icon(
                                Icons.circle_rounded,
                                size: 17,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.circle_rounded,
                                size: 12,
                              ),
                        const SizedBox(width: 15),
                        index_circt == 1
                            ? const Icon(
                                Icons.circle_rounded,
                                size: 17,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.circle_rounded,
                                size: 12,
                              ),
                        const SizedBox(width: 15),
                        index_circt == 2
                            ? const Icon(
                                Icons.circle_rounded,
                                size: 17,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.circle_rounded,
                                size: 12,
                              ),
                      ],
                    )
                  ],
                ),
              )
            : indox == 1
                ? Add()
                : Add());
  }

  Widget _buldListItem(BuildContext context, int index) {
    prodect pr = prodct[index];
    return SizedBox(
        height: 100,
        width: 300,
        child: Card(
          elevation: 5,
          child: InkWell(
            onTap: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              final a = prefs.getStringList("item1");
              print(a);
              print("the page $index \n");
              tim();
              // ignore: use_build_context_synchronously
              showDialog(
                  context: context,
                  builder: (_) {
                    return Column(
                      children: [
                        Visibility(
                          child: AlertDialog(
                            backgroundColor: Colors.transparent,
                            content:
                                Image.asset("images/pc8Oi1SZ1CsL1T15I8.gif"),
                            actions: [],
                          ),
                          visible: showImge,
                        ),
                        Visibility(
                          child: AlertDialog(
                            title: Text('Are you sure?'),
                          ),
                          visible: showText,
                        )
                      ],
                    );
                  });
            },
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Column(children: [
                Image.asset(
                  pr.img,
                  fit: BoxFit.cover,
                  width: 320,
                  height: 290,
                ),
                Text(
                  pr.txt,
                  style: GoogleFonts.tajawal(
                      color: Colors.black45,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ]),
            ),
          ),
        ));
  }
}
