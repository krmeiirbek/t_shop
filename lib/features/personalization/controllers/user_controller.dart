import 'package:get/get.dart';
import 'package:t_store/data/repository/authentication/authentication_repository.dart';
import 'package:t_store/data/repository/user/user_repository.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/personalization/models/user_model.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';
import 'package:t_store/utils/popups/show_dialogs.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = UserRepository.instance;
  final user = UserModel.empty().obs;
  final profileLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    profileLoading.value = true;
    try {
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      TLoaders.warningSnackBar(title: ohSnapText.tr, message: e.toString());
    } finally {
      profileLoading.value = false;
    }
  }

  void logoutAccount() {
    try {
      ShowDialogs.logoutShowDialog(
        title: exitText.tr,
        onPressed: () async => AuthenticationRepository.instance.logout(),
        middleText: exitMessageText.tr,
      );
    } catch (e) {
      TLoaders.warningSnackBar(title: ohSnapText.tr, message: e.toString());
    }
  }

  void deleteAccountWarningPopup() {
    try {
      ShowDialogs.deleteShowDialog(
        title: deleteAccountText.tr,
        onPressed: () async => deleteUserAccount(),
        middleText: deleteAccountMessageText.tr,
      );
    } catch (e) {
      TLoaders.warningSnackBar(title: ohSnapText.tr, message: e.toString());
    }
  }

  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        processingText.tr,
        TImages.loading,
      );
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: ohSnapText.tr, message: e.toString());
    }
  }
}
