import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/home_item.dart';

class HomeRepository extends GetxController {
  static HomeRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<HomeItemModel> fetchHomeItems() async {
    try {
      final snapshot = await _db.collection('AppDetails').doc('homeScreen').get();
      return HomeItemModel.fromSnapshot(snapshot);
    } catch (e) {
      throw e.toString();
    }
  }
}
