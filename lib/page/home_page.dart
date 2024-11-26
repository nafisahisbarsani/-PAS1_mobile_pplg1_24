import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pas1_mobile_pplg1_24/page/menu/favorit/favorit_page.dart';
import 'package:pas1_mobile_pplg1_24/page/menu/profile/profile_page.dart';
import 'package:pas1_mobile_pplg1_24/page/menu/team/TeamController.dart';
import 'package:pas1_mobile_pplg1_24/page/menu/team/TeamView.dart';

import '../controller/bottom_nav_ctr.dart';

class HomePage extends StatelessWidget {
  final BottomNavCtr bottomNavCtr;
  final TeamController teamController;

   HomePage({super.key, required this.bottomNavCtr, required this.teamController});

  @override
  Widget build(BuildContext context) {
    final BottomNavCtr bottomNavCtr = Get.find();
    final List<Widget> menus = [
      TeamView(),
      FavoritPage(),
      ProfilePage(),
    ];
    return Obx((){
      return Scaffold(
        body: IndexedStack(
          index: bottomNavCtr.selectedIndex.value,
          children: menus,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomNavCtr.selectedIndex.value,
          onTap: bottomNavCtr.changeIndexMenu,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.sports_soccer_rounded), label: "Team"),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Favorit"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      );
    });
  }
}
