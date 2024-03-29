import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/product/reviews_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:t_store/features/shop/screens/product_reviews/product_review.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final reviewsController = ReviewsController.instance;
    reviewsController.getProductReviews(product.id);
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// - Product Image Slider
            TProductImageSlider(product: product),

            /// - Product Details
            Padding(
              padding: EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Rating & Share Button
                  Obx(() {
                    if (ReviewsController.instance.reviewsLoading.value) {
                      return const SizedBox(height: 10, width: 50, child: LinearProgressIndicator(color: TColors.primary));
                    }
                    return const TRatingAndShare();
                  }),

                  /// -- Price, Title, Stock, & Brand
                  TProductMetaData(product: product),

                  /// -- Attributes
                  if (product.productType == ProductType.variable.toString()) TProductAttributes(product: product),
                  if (product.productType == ProductType.variable.toString()) SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(payment.tr),
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Description
                  TSectionHeading(title: description.tr, showActionButton: false),
                  SizedBox(height: TSizes.spaceBtwSections),
                  ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: showMoreDetails.tr,
                    trimExpandedText: showLess.tr,
                    moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                  if (product.productPerformances != null) const TSectionHeading(title: 'Характеристикасы', showActionButton: false),
                  if (product.productPerformances != null) SizedBox(height: TSizes.spaceBtwSections),
                  if (product.productPerformances != null)
                    Column(
                      children: product.productPerformances!
                          .map(
                            (e) => Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(child: Text('${e.name} : ', overflow: TextOverflow.visible)),
                                    Expanded(flex: 2, child: Text('${e.value}', overflow: TextOverflow.visible)),
                                  ],
                                ),
                                const SizedBox(height: 5),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  if (product.productPerformances != null) SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Reviews
                  const Divider(),
                  SizedBox(height: TSizes.spaceBtwItems),
                  Obx(
                    () {
                      if (ReviewsController.instance.reviewsLoading.value) {
                        return const SizedBox(height: 5, child: LinearProgressIndicator(color: TColors.primary));
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TSectionHeading(title: '${comments.tr}(${reviewsController.productReviews.length})', showActionButton: false),
                          IconButton(
                            icon: const Icon(Iconsax.arrow_right_3_outline, size: 18),
                            onPressed: () => Get.to(() => const ProductReviewsScreen()),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
