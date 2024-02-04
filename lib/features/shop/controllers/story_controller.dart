import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repository/story/story_repository.dart';
import 'package:t_store/features/shop/models/story_model.dart';
import 'package:t_store/features/shop/screens/story/story.dart';
import 'package:t_store/features/shop/screens/story/widgets/story_item.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TStoryController extends GetxController {
  static TStoryController get instance => Get.find();

  final storyRepository = Get.put(StoryRepository());
  final isLoading = false.obs;

  final currentStoryIndex = 0.obs;
  final storyWidgets = <Widget>[].obs;
  final percentWatched = <double>[].obs;
  final stories = <StoryModel>[].obs;

  @override
  void onInit() {
    createStoryWidgets();
    super.onInit();
  }

  void createStoryWidgets() async {
    isLoading.value = true;
    final s = await storyRepository.getStories();
    stories.assignAll(s);
    for (final story in stories) {
      if (story.type == StoryType.image) {
        storyWidgets.add(StoryItem(backgroundColor: Colors.white, image: story.mediaUrl));
      }
    }
    for (int i = 0; i < storyWidgets.length; i++) {
      percentWatched.add(0);
    }
    isLoading.value = false;
  }

  void startWatching() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (percentWatched[currentStoryIndex.value] + 0.01 < 1) {
        percentWatched[currentStoryIndex.value] += 0.01;
      } else {
        percentWatched[currentStoryIndex.value] = 1;
        timer.cancel();
        if (currentStoryIndex.value < storyWidgets.length - 1) {
          currentStoryIndex.value++;
          startWatching();
        } else {
          Get.back();
        }
      }
    });
  }

  void openStory(int? index) {
    Get.to(() => const StoryScreen());
    if (index != null && index < storyWidgets.length) {
      currentStoryIndex.value = index;
      for (int i = index; i < storyWidgets.length; i++) {
        percentWatched[i] = 0;
      }
      startWatching();
    }
  }

  void onTapDown(TapDownDetails details) {
    final screenWidth = THelperFunctions.screenWidth();
    final dx = details.globalPosition.dx;

    if (dx < screenWidth / 2) {
      if (currentStoryIndex > 0) {
        percentWatched[currentStoryIndex.value - 1] = 0;
        percentWatched[currentStoryIndex.value] = 0;
        currentStoryIndex.value--;
      }
    } else {
      if (currentStoryIndex < storyWidgets.length - 1) {
        percentWatched[currentStoryIndex.value] = 1;
        currentStoryIndex.value++;
      } else {
        percentWatched[currentStoryIndex.value] = 1;
      }
    }
  }
}
