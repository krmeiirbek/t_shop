import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repository/user/user_repository.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/localization/tr_constants.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';

///Controller to manage user-Related functionality

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  ///Variables
  final nameController = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// init user data when Home screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  ///Fetch User Records
  Future<void> initializeNames() async {
    nameController.text = userController.user.value.name;
  }

  Future<void> updateUserName() async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialog(
        processingText.tr,
        TImages.loading,
      );

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Update User's first & last name in the Firebase Firestore
      Map<String, dynamic> name = {
        'name': nameController.text.trim(),
      };
      await userRepository.updateSingleField(name);

      // Update the Rx User value
      userController.user(
        userController.user.value.copyWith(name: nameController.text.trim()),
      );

      //Remove Loader
      TFullScreenLoader.stopLoading();

      Get.back();

      TLoaders.successSnackBar(
        title: updatedText.tr,
      );
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
        title: ohSnapText.tr,
        message: e.toString(),
      );
    }
  }
}
