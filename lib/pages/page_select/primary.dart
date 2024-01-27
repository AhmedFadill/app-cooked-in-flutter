import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
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
  List<prodect> prodct=[
    prodect('images/png-clipart-food-fried-food-food-delicatessen.png', "فطور"),
    prodect('images/pngtree-charcoal-biryani-free-psd-png-image_9122563.png', "غداء"),
    prodect('images/dinner.png', "عشاء"),
  ];
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const GNav(
        gap: 8,
        tabMargin: EdgeInsets.all(5),
        activeColor: Colors.white,
        tabBackgroundColor: Color.fromARGB(255, 243, 67, 54),
        tabBorderRadius: 50,
        tabs: [
        GButton(icon: Icons.home,text: "Home",),
        GButton(icon: Icons.add,text: "Add",),
        GButton(icon: Icons.settings,text:"Setting"),
      ]),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 150,
              // decoration: const BoxDecoration(
              //   color: Color(0xffA94438),
              //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),
              //   bottomRight: Radius.circular(15)),
              // ),
              child:SafeArea(
                child: Column(
                  children: [
                    SizedBox(height: 15,),
                    Text("Food Menu",textAlign: TextAlign.center,
                    style: GoogleFonts.aBeeZee(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold),),
                    Divider(color: Colors.red[500],thickness: 3,indent: 75,endIndent: 75,),
                    SizedBox(height: 5,),
                    Text("اختر الطبق الذي تريده",style: GoogleFonts.tajawal(fontSize: 20,fontWeight: FontWeight.bold),)
                  ],
                ))
            ),
            SizedBox(height: 100,),
            SizedBox(
              height: 250,
              child: ScrollSnapList(
                itemBuilder: _buldListItem,
                 itemCount: prodct.length,
                  itemSize: 200,
                   onItemFocus: (index){},
                   dynamicItemSize: true,
                   
                   ),
            ),
          ],
        ),
      )
           );
  }
  Widget _buldListItem(BuildContext context,int index){
    prodect pr=prodct[index];
    return SizedBox(
      height: 100,
      width: 200,
      child: Card(
        elevation: 5,
        child: InkWell(
          onTap: () => print("the page $index \n"),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Column(
              children: [
                Image.asset(pr.img,fit: BoxFit.cover,width: 220,height: 190,),
                Text(pr.txt,style: GoogleFonts.tajawal(color: Colors.black45,fontSize: 20,fontWeight: FontWeight.bold),)
              ]
              ),
          
          ),
        ),
      )
    );
  }
}