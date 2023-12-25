import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repository/authentication/authentication_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  late TextEditingController phoneNumberController;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    phoneNumberController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  void phoneAuthentication() async {
    await AuthenticationRepository.instance
        .phoneAuthentication("+7${phoneNumberController.text.trim()}");
  }
}
