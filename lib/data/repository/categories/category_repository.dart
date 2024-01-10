import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // @override
  // void onInit() async {
  //   super.onInit();
  //   print('start');
  //   await uploadDummyData(TDummyData.categories);
  //   print('end');
  // }

  Future<List<CategoryModel>> getCategories() async {
    try {
      final snapshot = await _db
          .collection('Categories')
          .where('IsFeatured', isEqualTo: true)
          .get();
      return snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
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

  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final snapshot = await _db
          .collection('Categories')
          .where('ParentId', isEqualTo: categoryId)
          .get();
      return snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
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

  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      var batch = _db.batch();
      // final storage = Get.put(TFirebaseStorageService());
      for (var category in categories) {
        // final file = await storage.getImageDataFromAssets(category.image);
        // final url =
        //     await storage.uploadImageData('Categories', file, category.nameRU);
        // category.image = url;
        batch.set(
            _db.collection('Categories').doc(category.id), category.toJson());
      }
      await batch.commit();
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
