import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/products/ratings/rating_indicator.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({Key? key}) : super(key: key);

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
                const CircleAvatar(
                    backgroundImage: AssetImage(TImages.userProfileImage1)),
                SizedBox(width: TSizes.spaceBtwItems),
                Text('John Doe', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems),

        /// Review
        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            SizedBox(width: TSizes.spaceBtwItems),
            Text('01 қараша, 2023 жыл', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems),
        const ReadMoreText(
          'Қолданбаның пайдаланушы интерфейсі өте интуитивті. Мен шарлауды және сатып алуларды кедергісіз жасай алдым. тамаша жұмыс!!',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' Аз көрсету',
          trimCollapsedText: ' Толығырақ көрсету',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
        ),
        SizedBox(height: TSizes.spaceBtwItems),

        /// Company Review
        TRoundedContainer(
            backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
            child: Padding(
              padding: EdgeInsets.all(TSizes.md),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("ZHET MARKET",
                          style: Theme.of(context).textTheme.titleMedium),
                      Text("02 қараша, 2023 жыл",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
                    'Қолданбаның пайдаланушы интерфейсі өте интуитивті. Мен шарлауды және сатып алуларды кедергісіз жасай алдым. тамаша жұмыс!!',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimExpandedText: ' Аз көрсету',
                    trimCollapsedText: ' Толығырақ көрсету',
                    moreStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: TColors.primary),
                    lessStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: TColors.primary),
                  ),
                ],
              ),
            )),
        SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }
}
