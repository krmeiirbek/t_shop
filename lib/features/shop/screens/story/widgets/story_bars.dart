import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/controllers/story_controller.dart';
import 'package:t_store/features/shop/screens/story/widgets/progress_bar.dart';

class StoryBars extends GetView<TStoryController> {
  const StoryBars({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: controller.percentWatched.map((percent) => Expanded(child: StoryProgressBar(percentWatched: percent))).toList(),
        ),
      ),
    );
  }
}
