import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:t_store/common/widgets/images/rounded_image.dart';
import 'package:t_store/common/widgets/shimmer/shimmer.dart';
import 'package:t_store/features/shop/controllers/banner_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      if (controller.isLoading.value) {
        return const TShimmerEffect(width: double.infinity, height: 190);
      }
      if (controller.banners.isEmpty) {
        return Center(
          child: Text(
            'Ешнәрсе табылмады',
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: THelperFunctions.isDarkMode(context)
                      ? TColors.dark
                      : TColors.light,
                ),
          ),
        );
      } else {
        return Column(
          children: [
            CarouselSlider(
              items: controller.banners
                  .map(
                    (banner) => TRoundedImage(
                      imageUrl: banner.imageURL,
                      isNetworkImage: true,
                      onPressed: () => Get.toNamed(banner.targetScreen),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, _) =>
                    controller.carousalCurrentIndex(index),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < controller.banners.length; i++)
                      TCircularContainer(
                        height: 4,
                        width: 20,
                        margin: const EdgeInsets.only(right: 10),
                        backgroundColor:
                            controller.carousalCurrentIndex.value == i
                                ? TColors.primary
                                : TColors.grey,
                      ),
                  ],
                )),
          ],
        );
      }
    });
  }
}
