import 'package:get/get.dart';
import 'package:t_store/data/repository/authentication/authentication_repository.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final userController = Get.put(UserController());

  void signInWithGoogle() async {
    if (AuthenticationRepository.instance.loading.value) {
      return;
    }
    try {
      TFullScreenLoader.openLoadingDialog(
        "Жүктелуде...",
        TImages.loading,
      );

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      await userController.saveUserRecord(userCredentials);

      TFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
        title: "О, Жоқ",
        message: e.toString(),
      );
    }
  }
}
