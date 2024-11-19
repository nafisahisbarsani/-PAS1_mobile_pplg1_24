import 'package:get/get.dart';

import '../page/user_model.dart';
import '../register/register_api_service.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  var user = Rxn<UserModel>();

  Future<void> register(
      String username, String password, String fullName, String email) async {
    isLoading.value = true;
    try {
      final response = await RegisterApiService.register(
          username, password, fullName, email);
      if (response != null && response['status'] == true) {
        Get.snackbar('Success', response['message'] ?? 'Registrasi berhasil');
        Future.delayed(Duration(seconds: 3), () {
          Get.offAllNamed('/login');
        });
      } else {
        Get.snackbar(
            'Error', response?['message'] ?? 'Registrasi gagal, coba lagi');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
