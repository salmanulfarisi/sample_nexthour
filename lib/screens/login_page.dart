import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_test/controller/login_controller/login_controller.dart';
import 'package:sample_test/screens/signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: loginController.emailController,
                decoration: const InputDecoration(hintText: 'email'),
              ),
              TextFormField(
                controller: loginController.passwordController,
                decoration: const InputDecoration(hintText: 'password'),
              ),
              ElevatedButton(
                onPressed: () {
                  loginController.callLoginApi();
                },
                child: const Text('Login'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Get.offAll(() => const SignupPage());
                    loginController.emailController.clear();
                    loginController.passwordController.clear();
                  },
                  child: const Text('No register?'))
            ],
          ),
        ),
      ),
    );
  }
}
