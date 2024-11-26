import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pas1_mobile_pplg1_24/page/home_page.dart';
import 'package:pas1_mobile_pplg1_24/page/menu/team/TeamController.dart';
import 'package:pas1_mobile_pplg1_24/register/register_page.dart';
import 'binding/app_binding.dart';
import 'controller/bottom_nav_ctr.dart';
import 'controller/login_controller.dart';
import 'login/login_page.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: loginController.isLoggedIn() ? '/' : '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginPage(), // Your login page
          binding: AppBinding(),
        ),
        GetPage(
          name: '/register',
          page: () => RegisterPage(), // Your register page
          binding: AppBinding(),
        ),
        GetPage(
          name: '/',
          page: () => HomePage(
            bottomNavCtr: Get.find<BottomNavCtr>(),
            teamController: Get.find<TeamController>(),
          ),
          binding: AppBinding(),
        ),
      ],
    );
  }
}