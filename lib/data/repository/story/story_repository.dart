import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/home_story_model.dart';
import 'package:t_store/features/shop/models/story_model.dart';

class StoryRepository extends GetxController {
  static StoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<StoryModel>> getStories(List<String> storyIds) async {
    try {
      final snapshot = await _db.collection('Stories').where(FieldPath.documentId, whereIn: storyIds).get();
      return snapshot.docs.map((e) => StoryModel.fromJson(e.data())).toList();
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<HomeStoryModel>> getHomeStories() async {
    try {
      final snapshot = await _db.collection('AppDetails').doc('stories').collection('stories').get();
      return snapshot.docs.map((e) => HomeStoryModel.fromJson(e.data())).toList();
    } catch (e) {
      throw e.toString();
    }
  }
}
