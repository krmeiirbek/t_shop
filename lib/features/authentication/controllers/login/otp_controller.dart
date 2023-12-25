import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repository/authentication/authentication_repository.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  final phoneNumber = ''.obs;

  @override
  void onInit() {
    phoneNumber.value = Get.arguments as String;
    super.onInit();
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void verifyOTP(String otp) async {
    TFullScreenLoader.openLoadingDialog(
      'Өңделуде',
      'assets/lottie/loading.json',
    );
    final isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    TFullScreenLoader.stopLoading();
    if (isVerified) {
      Get.offAll(() => const NavigationMenu());
    } else {
      TLoaders.warningSnackBar(title: 'Растау коды жарамсыз');
      pinController.clear();
    }
  }
}
