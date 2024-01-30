import 'package:get/get.dart';
import 'package:t_store/data/repository/products/product_repository.dart';
import 'package:t_store/features/shop/models/product_review_model.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/utils/popups/loaders.dart';

class ReviewsController extends GetxController {
  static ReviewsController get instance => Get.find();

  final reviewsLoading = false.obs;
  final productRepository = ProductRepository.instance;
  final productReviews = <ProductReviewModel>[].obs;

  Future<void> getProductReviews(String productId) async {
    try {
      reviewsLoading.value = true;
      final productReviews = await productRepository.getProductReviews(productId);
      this.productReviews.assignAll(productReviews);
    } catch (e) {
      TLoaders.errorSnackBar(title: ohSnapText.tr, message: e.toString());
    } finally {
      reviewsLoading.value = false;
    }
  }

  double averageRating() {
    if (productReviews.isEmpty) {
      return 0.0;
    }

    var sumOfRatings = 0.0;

    for (var review in productReviews) {
      sumOfRatings += review.rating;
    }

    return double.parse((sumOfRatings / productReviews.length).toStringAsFixed(1));
  }

  double getAveragePercentForEachStar(int star) {
    if (productReviews.isEmpty) {
      return 0.0;
    }

    var countOfStar = productReviews.where((review) => review.rating == star.toDouble()).length;
    return countOfStar / productReviews.length;
  }
}
