import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/utils/constants/image_strings.dart';

import '../../controllers/onboarding/onboarding_controller.dart';
import 'widgets/onboarding_dot_navigation.dart';
import 'widgets/onboarding_next_button.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: onBoardingTitle1.tr,
                subtitle: onBoardingSubTitle1.tr,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: onBoardingTitle2.tr,
                subtitle: onBoardingSubTitle2.tr,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: onBoardingTitle3.tr,
                subtitle: onBoardingSubTitle3.tr,
              ),
            ],
          ),

          /// Skip button
          const OnBoardingSkip(),

          /// Dot navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Circular button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
