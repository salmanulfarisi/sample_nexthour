import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sample_test/api_service/signup_service/signup_service.dart';
import 'package:sample_test/model/signup_model/signup_model.dart';
import 'package:sample_test/model/signup_model/signup_response_model.dart';
import 'package:sample_test/screens/login_page.dart';

class SignUpController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  late TextEditingController emailController, passwordController;

  void callSignupApi() async {
    final data = SignupModel(
        email: emailController.text, password: passwordController.text);
    SignupResponseModel? signupResponse =
        await SignupService().signupUser(data);
    if (signupResponse == null) {
      Fluttertoast.showToast(msg: 'no response');
      return;
    } else if (signupResponse.success == true) {
      Fluttertoast.showToast(msg: 'Account Created Successfully');
      Get.defaultDialog(
          title: 'Account Created Successfully',
          content: const Text(
              'Conformation Mail sent to your E-mail. please Verify and come back'),
          onConfirm: () {
            Get.to(() => const LoginPage());
          },
          onCancel: () {
            Get.back();
          });
    } else if (signupResponse.success != true) {
      Fluttertoast.showToast(msg: ('ksakfsa;f'));
    } else {
      Fluttertoast.showToast(msg: 'Something went wrong');
    }
  }
}
