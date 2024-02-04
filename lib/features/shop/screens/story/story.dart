import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/controllers/story_controller.dart';
import 'package:t_store/features/shop/screens/story/widgets/story_bars.dart';

class StoryScreen extends GetView<TStoryController> {
  const StoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => controller.onTapDown(details),
      child: Scaffold(
        body: Obx(
          () => Stack(
            children: [
              controller.storyWidgets[controller.currentStoryIndex.value],
              const SafeArea(child: StoryBars()),
            ],
          ),
        ),
      ),
    );
  }
}
