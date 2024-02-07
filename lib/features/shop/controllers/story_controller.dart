import 'package:get/get.dart';
import 'package:story_view/story_view.dart';
import 'package:t_store/data/repository/story/story_repository.dart';
import 'package:t_store/features/shop/models/home_story_model.dart';
import 'package:t_store/features/shop/models/story_model.dart';
import 'package:t_store/features/shop/screens/story/story.dart';

class TStoryController extends GetxController {
  static TStoryController get instance => Get.find();

  final storyRepository = StoryRepository.instance;
  final storyController = StoryController();
  final isLoading = false.obs;

  final currentStoryPage = 0.obs;
  final storyWidgets = <List<StoryModel>>[].obs;
  final homeStories = <HomeStoryModel>[].obs;

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    createStoryWidgets();
    super.onInit();
  }

  void createStoryWidgets() async {
    isLoading.value = true;
    final s = await storyRepository.getHomeStories();
    homeStories.assignAll(s);
    for (final homeStory in homeStories) {
      final st = await storyRepository.getStories(homeStory.stories);
      storyWidgets.add(st);
    }
    isLoading.value = false;
  }

  void openStory(int? index) {
    if (index != null) {
      currentStoryPage.value = index;
    }
    Get.to(() => const StoryScreen());
  }

  void onComplete() {
    Get.back();
  }

  void onStoryShow(StoryItem item) {}

  dynamic onVerticalSwipeComplete(Direction? direction) {
    if (direction == Direction.down) {
      Get.back();
    }
  }
}
