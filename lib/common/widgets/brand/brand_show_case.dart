import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/shimmer/shimmer.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/features/shop/screens/brand/brand_products.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import 'brand_card.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key,
    required this.images,
    required this.brand,
  });

  final List<String> images;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: TRoundedContainer(
        showBorder: true,
        borderColor: TColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.all(TSizes.md),
        margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Brand with Products Count
            TBrandCard(showBorder: false, brand: brand),
            SizedBox(height: TSizes.spaceBtwItems),

            /// Brand Top 3 Product Images
            Row(
              children: images.map((image) => brandTopProductImageWidget(image, context)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        margin: EdgeInsets.only(right: TSizes.sm),
        padding: EdgeInsets.all(TSizes.md),
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: image,
          progressIndicatorBuilder: (_, __, ___) => const TShimmerEffect(width: 100, height: 100),
          errorWidget: (_, __, ___) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
