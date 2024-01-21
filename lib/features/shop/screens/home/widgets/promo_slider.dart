import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:t_store/common/widgets/images/rounded_image.dart';
import 'package:t_store/common/widgets/shimmer/shimmer.dart';
import 'package:t_store/features/shop/controllers/banner_controller.dart';
import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({super.key, this.futureMethod});

  final Future<List<BannerModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = BannerController.instance;
    return FutureBuilder<List<BannerModel>>(
      future: futureMethod,
      initialData: const [],
      builder: (context, snapshot) {
        const loader = TShimmerEffect(width: double.infinity, height: 190);
        final empty = Center(
          child: Text(
            'Ешнәрсе табылмады',
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.dark,
                ),
          ),
        );
        final widget = TCloudHelperFunctions.checkMultiRecordState(
          snapshot: snapshot,
          loader: loader,
          nothingFound: empty,
        );
        if (widget != null) return widget;

        var banners = snapshot.data!;
        return Column(
          children: [
            CarouselSlider(
              items: banners
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
                onPageChanged: (index, _) => controller.carousalCurrentIndex(index),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < banners.length; i++)
                    TCircularContainer(
                      height: 4,
                      width: 20,
                      margin: const EdgeInsets.only(right: 10),
                      backgroundColor: controller.carousalCurrentIndex.value == i ? TColors.primary : TColors.grey,
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
