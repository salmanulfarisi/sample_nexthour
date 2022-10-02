import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_test/controller/signup_controller/signup_controller.dart';
import 'package:sample_test/screens/login_page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignUpController signUpController = Get.put(SignUpController());
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: signUpController.emailController,
                decoration: const InputDecoration(hintText: 'email'),
              ),
              TextFormField(
                controller: signUpController.passwordController,
                decoration: const InputDecoration(hintText: 'password'),
              ),
              ElevatedButton(
                onPressed: () {
                  signUpController.callSignupApi();
                },
                child: const Text('Signup'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Get.offAll(() => const LoginPage());
                    signUpController.emailController.clear();
                    signUpController.passwordController.clear();
                  },
                  child: const Text('go to loginPage'))
            ],
          ),
        ),
      ),
    );
  }
}
