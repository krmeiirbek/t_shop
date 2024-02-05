import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';
import 'package:t_store/features/shop/controllers/story_controller.dart';
import 'package:t_store/features/shop/models/story_model.dart';

class StoryScreen extends GetView<TStoryController> {
  const StoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Obx(
            () => StoryView(
              controller: controller.storyController,
              storyItems: controller.storyWidgets[controller.currentStoryPage.value].map((story) {
                if (story.type == StoryType.image || story.type == StoryType.gif) {
                  return StoryItem.pageImage(url: story.mediaUrl, controller: controller.storyController);
                } else if (story.type == StoryType.video) {
                  return StoryItem.pageVideo(story.mediaUrl, controller: controller.storyController);
                } else {
                  return null;
                }
              }).toList(),
              onStoryShow: controller.onStoryShow,
              onComplete: controller.onComplete,
              onVerticalSwipeComplete: controller.onVerticalSwipeComplete,
              progressPosition: ProgressPosition.top,
              repeat: false,
              inline: true,
            ),
          ),
        ),
      ),
    );
  }
}
