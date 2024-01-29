import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/controllers/product/reviews_controller.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';

class TOverallProductRating extends GetView<ReviewsController> {
  const TOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            controller.averageRating().toString(),
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              TRatingProgressIndicator(text: '5', value: controller.getAveragePercentForEachStar(5)),
              TRatingProgressIndicator(text: '4', value: controller.getAveragePercentForEachStar(4)),
              TRatingProgressIndicator(text: '3', value: controller.getAveragePercentForEachStar(3)),
              TRatingProgressIndicator(text: '2', value: controller.getAveragePercentForEachStar(2)),
              TRatingProgressIndicator(text: '1', value: controller.getAveragePercentForEachStar(1)),
            ],
          ),
        ),
      ],
    );
  }
}
