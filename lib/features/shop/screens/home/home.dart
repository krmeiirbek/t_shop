import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/shop/controllers/banner_controller.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/controllers/home_controller.dart';
import 'package:t_store/features/shop/controllers/product/cart_controller.dart';
import 'package:t_store/features/shop/controllers/product/favourites_controller.dart';
import 'package:t_store/features/shop/controllers/product/product_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

import 'widgets/home_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Get.put(BannerController());
    Get.put(ProductController());
    Get.put(CartController());
    Get.put(CategoryController());
    Get.put(FavouritesController());
    Get.put(UserController());
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
              child: const HomeItems(),
            ),
          ],
        ),
      ),
    );
  }
}
