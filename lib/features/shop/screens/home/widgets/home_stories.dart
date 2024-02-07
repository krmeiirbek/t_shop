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
    final controller = TStoryController.instance;
    return Obx(
      () {
        if (controller.isLoading.value) {
          return const TStoryShimmer();
        }
        return SizedBox(
          height: 110,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.storyWidgets.length,
            itemBuilder: (context, index) => SizedBox(
              width: 100,
              child: StoryCircle(
                onTap: () => controller.openStory(index),
                image: controller.homeStories[index].image,
                title: controller.homeStories[index].title,
              ),
            ),
          ),
        );
      },
    );
  }
}
