import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:t_store/data/repository/user/user_repository.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';
import 'package:t_store/utils/local_storage/storage_utility.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  final deviceStorage = GetStorage();
  final loading = false.obs;

  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
    super.onReady();
  }

  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      await TLocalStorage.init(user.uid);
      Get.offAll(() => const NavigationMenu());
    } else {
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(() => const OnBoardingScreen());
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    loading.value = true;
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatExceptions().message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw e.toString();
    } finally {
      loading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatExceptions().message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatExceptions().message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }
}
