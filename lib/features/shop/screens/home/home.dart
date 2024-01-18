import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/controllers/product/cart_controller.dart';
import 'package:t_store/features/shop/controllers/product/product_controller.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    Get.put(CartController());
    Get.put(CategoryController());
    return Scaffold(
      appBar: TAppBar(
        usePrimaryBG: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TTexts.homeAppbarTitle,
              style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey),
            ),
            Text(
              TTexts.homeAppbarSubTitle,
              style: Theme.of(context).textTheme.titleMedium!.apply(color: TColors.white),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.support_agent_outlined,
              color: TColors.white,
              size: 28,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  SizedBox(height: TSizes.spaceBtwSections),
                  const TSearchContainer(text: 'Дүкеннен іздеу'),
                  SizedBox(height: TSizes.spaceBtwSections),
                  // const THomeCategories(),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(),
                  SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(
                    title: 'Танымал өнімдер',
                    onPressed: () => Get.to(
                      () => AllProducts(
                        title: 'Танымал өнімдер',
                        futureMethod: controller.fetchAllFeaturedProducts(),
                      ),
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const TVerticalProductShimmer();
                    }
                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                        child: Text(
                          'Ешнәрсе табылмады',
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                color: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.dark,
                              ),
                        ),
                      );
                    }
                    return TGridLayout(
                      itemBuilder: (_, index) => TProductCardVertical(product: controller.featuredProducts[index]),
                      itemCount: controller.featuredProducts.length,
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
