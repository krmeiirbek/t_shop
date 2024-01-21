import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/data/services/firebase_storage_service.dart';
import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<BannerModel>> fetchBannersWithIds(List<String> bannerIds) async {
    try {
      final result = await _db.collection('Banners').where(FieldPath.documentId, whereIn: bannerIds).get();
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatExceptions();
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> uploadDummyData(List<BannerModel> banners) async {
    try {
      final storage = Get.put(TFirebaseStorageService());
      for (var banner in banners) {
        final file = await storage.getImageDataFromAssets(banner.imageURL);
        final url = await storage.uploadImageData('Banners', file, banner.imageURL);
        banner.imageURL = url;
        await _db.collection("Banners").doc().set(banner.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatExceptions();
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }
}
