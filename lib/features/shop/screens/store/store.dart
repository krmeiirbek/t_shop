import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/appbar/tabbar.dart';
import 'package:t_store/common/widgets/brand/brand_card.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:t_store/common/widgets/shimmer/brands_shimmer.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/brand_controller.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/screens/brand/all_brands.dart';
import 'package:t_store/features/shop/screens/brand/brand_products.dart';
import 'package:t_store/features/shop/screens/cart/cart.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import 'widgets/category_tab.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    final brandController = Get.put(BrandController());
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title:
              Text('Дүкен', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            TCartCounterIcon(onPressed: () => Get.to(() => const CartScreen())),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) => [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: THelperFunctions.isDarkMode(context)
                  ? TColors.black
                  : TColors.white,
              expandedHeight: 440,
              flexibleSpace: Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  // 8705 642 2509
                  shrinkWrap: true,
                  children: [
                    SizedBox(height: TSizes.spaceBtwItems),
                    const TSearchContainer(
                      text: 'Дүкеннен іздеу',
                      showBackGround: false,
                      padding: EdgeInsets.zero,
                    ),
                    SizedBox(height: TSizes.spaceBtwSections),
                    TSectionHeading(
                      title: 'Таңдаулы брендтер',
                      onPressed: () => Get.to(() => const AllBrandsScreen()),
                    ),
                    SizedBox(height: TSizes.spaceBtwItems / 1.5),
                    Obx(() {
                      if (brandController.isLoading.value) {
                        return const TBrandsShimmer();
                      }
                      if (brandController.featuredBrands.isEmpty) {
                        return Center(
                          child: Text(
                            'Ешнәрсе табылмады',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(
                                  color: THelperFunctions.isDarkMode(context)
                                      ? TColors.light
                                      : TColors.dark,
                                ),
                          ),
                        );
                      }
                      return TGridLayout(
                        itemCount: brandController.featuredBrands.length,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          final brand = brandController.featuredBrands[index];
                          return TBrandCard(
                            brand: brand,
                            showBorder: false,
                            onTap: () => Get.to(
                              () => BrandProducts(
                                brand: brand,
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  ],
                ),
              ),
              bottom: TTabBar(
                tabs: categories
                    .map((category) => Tab(child: Text(category.name)))
                    .toList(),
              ),
            ),
          ],
          body: TabBarView(
            children: categories
                .map((category) => TCategoryTab(category: category))
                .toList(),
          ),
        ),
      ),
    );
  }
}
