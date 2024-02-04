import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/story_model.dart';

class StoryRepository extends GetxController {
  static StoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<StoryModel>> getStories() async {
    try {
      final snapshot = await _db.collection('Stories').get();
      return snapshot.docs.map((e) => StoryModel.fromJson(e.data())).toList();
    } catch (e) {
      throw e.toString();
    }
  }
}
