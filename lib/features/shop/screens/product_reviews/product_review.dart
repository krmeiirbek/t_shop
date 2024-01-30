import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/products/ratings/rating_indicator.dart';
import 'package:t_store/features/shop/controllers/product/reviews_controller.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProductReviewsScreen extends GetView<ReviewsController> {
  const ProductReviewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- Appbar
      appBar: TAppBar(
        title: Text(commentsAndRatings.tr),
        showBackArrow: true,
      ),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(productReviewsTitle.tr),
              SizedBox(height: TSizes.spaceBtwItems),

              /// Overall Product Ratings
              const TOverallProductRating(),
              TRatingBarIndicator(rating: controller.averageRating()),
              Text('${controller.productReviews.length}', style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: TSizes.spaceBtwSections),

              /// User Reviews List
              if (controller.productReviews.isNotEmpty)
                for (var review in controller.productReviews) UserReviewCard(review: review),
            ],
          ),
        ),
      ),
    );
  }
}
