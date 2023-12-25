import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/authentication/screens/login/otp.dart';
import 'package:t_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:t_store/utils/local_storage/storage_utility.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  final deviceStorage = TLocalStorage();
  final verificationId = ''.obs;
  final loading = false.obs;

  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
    super.onReady();
  }

  screenRedirect() async {
    // Local Storage

    if (kDebugMode) {
      print('==================== GET STORAGE Auth Repo ====================');
      print(deviceStorage.readData('IsFirstTime'));
    }

    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.readData('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }

  Future<void> phoneAuthentication(String phoneNumber) async {
    try {
      loading.value = true;
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
          if (kDebugMode) {
            print('verificationCompleted');
          }
        },
        verificationFailed: (e) {
          loading.value = false;
          if (e.code == 'invalid-phone-number') {
            Get.snackbar('Error', 'The provided phone number is not valid');
          } else {
            Get.snackbar(e.code, e.message.toString());
            if (kDebugMode) {
              print(e.code);
              print(e.message.toString());
            }
          }
        },
        codeSent: (verificationId, resendToken) {
          this.verificationId.value = verificationId;
          loading.value = false;
          Get.to(() => const OTPScreen(), arguments: phoneNumber);
          if (kDebugMode) {
            print('codeSent');
            print(resendToken);
            print(verificationId);
          }
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
          if (kDebugMode) {
            print('codeAutoRetrievalTimeout');
          }
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<bool> verifyOTP(String otp) async {
    try {
      final credential =
          await _auth.signInWithCredential(PhoneAuthProvider.credential(
        verificationId: verificationId.value,
        smsCode: otp,
      ));
      return credential.user != null;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }
}
