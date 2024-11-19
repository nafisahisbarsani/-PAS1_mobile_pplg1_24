import 'package:get/get.dart';
import 'package:pas1_mobile_pplg1_24/page/menu/team/TeamController.dart';
import '../controller/bottom_nav_ctr.dart';
import '../controller/login_controller.dart';
import '../controller/registetr_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<RegisterController>(() => RegisterController());
    Get.lazyPut<BottomNavCtr>(() => BottomNavCtr());
    Get.lazyPut<TeamController>(() => TeamController());
  }
}
