import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/products/ratings/rating_indicator.dart';
import 'package:t_store/features/shop/models/product_review_model.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({Key? key, required this.review}) : super(key: key);

  final ProductReviewModel review;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (review.userImageUrl != null && review.userImageUrl != '') const CircleAvatar(backgroundImage: AssetImage(TImages.userProfileImage1)),
                SizedBox(width: TSizes.spaceBtwItems),
                Text(review.userName ?? '', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems),

        /// Review
        Row(
          children: [
            TRatingBarIndicator(rating: review.rating),
            SizedBox(width: TSizes.spaceBtwItems),
            Text(THelperFunctions.getFormattedDate(review.timestamp), style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems),
        ReadMoreText(
          review.comment ?? '',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: showLess.tr,
          trimCollapsedText: showMoreDetails.tr,
          moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
          lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
        ),
        SizedBox(height: TSizes.spaceBtwItems),

        /// Company Review
        if (review.companyComment != null && review.companyTimestamp != null)
          TRoundedContainer(
            backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
            child: Padding(
              padding: EdgeInsets.all(TSizes.md),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(appName.tr, style: Theme.of(context).textTheme.titleMedium),
                      Text(THelperFunctions.getFormattedDate(review.companyTimestamp!), style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    review.companyComment ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimExpandedText: showLess.tr,
                    trimCollapsedText: showMoreDetails.tr,
                    moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                    lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                  ),
                ],
              ),
            ),
          ),
        SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }
}
