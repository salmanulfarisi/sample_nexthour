import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sample_test/api_service/login_service/login_service.dart';
import 'package:sample_test/model/login_model/login_model.dart';
import 'package:sample_test/model/login_model/login_respose_model.dart';
import 'package:sample_test/screens/home_page.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  late TextEditingController emailController, passwordController;

  void callLoginApi() async {
    final data = LoginModel(
        email: emailController.text, password: passwordController.text);
    LoginResponseModel? loginResponse = await LoginApiService().loginUser(data);
    if (loginResponse == null) {
      Fluttertoast.showToast(msg: 'no respose');
      return;
    } else if (loginResponse.success == true) {
      Fluttertoast.showToast(msg: 'Login successfull');
      Get.to(() => const HomePage());
      // log('not login something wrong');
    } else if (loginResponse.success != true) {
      Fluttertoast.showToast(msg: ('${loginResponse.success}'));
    } else {
      Fluttertoast.showToast(msg: 'Something went wrong');
    }
  }
}
