import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/shimmer/story_shimmer.dart';
import 'package:t_store/features/shop/controllers/story_controller.dart';
import 'package:t_store/features/shop/screens/story/widgets/story_circle.dart';

class THomeStories extends StatelessWidget {
  const THomeStories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TStoryController());
    return Obx(
      () {
        if (controller.isLoading.value) {
          return const TStoryShimmer();
        }
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.storyWidgets.length,
            itemBuilder: (context, index) => SizedBox(
              width: 80,
              child: StoryCircle(
                onTap: () => controller.openStory(index),
                image: controller.stories[index].mediaUrl,
                title: controller.stories[index].title,
              ),
            ),
          ),
        );
      },
    );
  }
}
