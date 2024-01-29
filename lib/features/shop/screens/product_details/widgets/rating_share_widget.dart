import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/controllers/product/reviews_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TRatingAndShare extends GetView<ReviewsController> {
  const TRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// --- Rating
        Row(
          children: [
            const Icon(Iconsax.star5, color: Colors.amber, size: 24),
            SizedBox(width: TSizes.spaceBtwItems / 2),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '${controller.averageRating()}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextSpan(text: '(${controller.productReviews.length})'),
                ],
              ),
            ),
          ],
        ),

        /// --- Share Button
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.share, size: TSizes.iconMd),
        ),
      ],
    );
  }
}
