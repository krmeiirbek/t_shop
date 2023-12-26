import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repository/authentication/authentication_repository.dart';
import 'package:t_store/data/repository/user/user_repository.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/personalization/models/user_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';
import 'package:t_store/utils/popups/show_dialogs.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());
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
      if (kDebugMode) {
        print(e);
      }
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        final user = UserModel(
          id: userCredentials.user!.uid,
          name: userCredentials.user!.displayName ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
        );

        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Деректер сақталмады',
        message: "Ақпаратыңызды сақтау кезінде бірдеңе дұрыс болмады. "
            "Деректерді профильде қайта сақтауға болады",
      );
    }
  }

  void logoutAccount() {
    ShowDialogs.logoutShowDialog(
        title: "Шығу",
        onPressed: () async => AuthenticationRepository.instance.logout(),
        middleText: "Есептік жазбадан шыққыңыз келетініне сенімдісіз бе?");
  }

  void deleteAccountWarningPopup() {
    ShowDialogs.deleteShowDialog(
        title: "Есептік жазбаны жою",
        onPressed: () async => deleteUserAccount(),
        middleText: 'Есептік жазбаны біржола жойғыңыз келетініне сенімдісіз бе?'
            ' Бұл әрекетті қайтару мүмкін емес және барлық деректеріңіз біржола жойылады.');
  }

  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        'Өңделуде',
        TImages.loading,
      );
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
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
      TLoaders.warningSnackBar(title: 'О, Жоқ', message: e.toString());
    }
  }
}
