import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repository/authentication/authentication_repository.dart';
import 'package:t_store/data/repository/user/user_repository.dart';
import 'package:t_store/features/personalization/models/user_model.dart';
import 'package:t_store/utils/popups/loaders.dart';
import 'package:t_store/utils/popups/show_dialogs.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

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
}
