import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controller/login_controller.dart';
import '../widget/my_button.dart';
import '../widget/my_color.dart';
import '../widget/my_text_button.dart';
import '../widget/my_text_field.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.find<LoginController>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
   LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextField(
              hintText: 'Usernmame',
              isObsecure: false,
              fontsize: 15,
              controller: usernameController,
            ),
            SizedBox(height: 10),
            MyTextField(
              hintText: 'Password',
              isObsecure: true,
              fontsize: 15,
              controller: passwordController,
            ),
            SizedBox(height: 20),
            Obx(() {
              return loginController.isLoading.value
                  ? const CircularProgressIndicator()
                  : MyButton(
                text: 'Login',
                color: textColor,
                onPressed: () {
                  final username = usernameController.text.trim();
                  final password = passwordController.text.trim();
                  if (username.isEmpty || password.isEmpty) {
                    Get.snackbar('Error', 'All fields are required');
                    return;
                  }
                  loginController.login(username, password);
                },
                fontSize: 14, fontWeight: FontWeight.bold,);
            }),
            SizedBox(height: 10),
            MyTextButton(
                text: 'Belum punya akun? Register',
                onPressed: () {
                  Get.toNamed('/register');
                },
                textColor: textColor,
                fontSize: 14,
                fontWeight: FontWeight.bold)
          ],
        ),
      ),
    );
  }
}
