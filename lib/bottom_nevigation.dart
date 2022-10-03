
import 'package:beting_app/sceens/nevigation%20screens/help_screens.dart';
import 'package:beting_app/sceens/nevigation%20screens/home_page.dart';
import 'package:beting_app/sceens/nevigation%20screens/profile_screens.dart';
import 'package:beting_app/sceens/nevigation%20screens/conversation_scren.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'Helper/style.dart';

class NavegationBar extends StatefulWidget {
  const NavegationBar({Key? key}) : super(key: key);

  @override
  State<NavegationBar> createState() => _NavegationBarState();
}


class _NavegationBarState extends State<NavegationBar> {


  int selectedindex = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final screen = [
         HomePage(),
    const HelpScreen(),
    const CoverstionScreen(),
     ProfileScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: const [
          Icon(Icons.home, size: 30,color: Colors.black,),
          Icon(Icons.rule, size: 30,color: Colors.black,),
          Icon(Icons.question_answer, size: 30,color: Colors.black,),
          Icon(Icons.person, size: 30,color: Colors.black,),
          
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Style.backgroundColor3,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            selectedindex = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: screen[selectedindex]);
      }
}

