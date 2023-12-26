import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repository/user/user_repository.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

import 'user_controller.dart';

class UpdatePhoneController extends GetxController {
  static UpdatePhoneController get instance => Get.find();

  final phoneNumber = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserPhoneNumberFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    initializePhoneNumber();
  }

  Future<void> initializePhoneNumber() async {
    phoneNumber.text = userController.user.value.phoneNumber;
  }

  Future<void> updatePhoneNumber() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        "Өңделуде... ",
        TImages.loading,
      );

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> phone = {
        "phoneNumber": phoneNumber.text.trim(),
      };
      await userRepository.updateSingleField(phone);

      userController.user(
        userController.user.value
            .copyWith(phoneNumber: phoneNumber.text.trim()),
      );

      TFullScreenLoader.stopLoading();

      Get.back();

      TLoaders.successSnackBar(
        title: "Жаңартылды",
      );
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
        title: 'О, Жоқ',
        message: e.toString(),
      );
    }
  }
}
