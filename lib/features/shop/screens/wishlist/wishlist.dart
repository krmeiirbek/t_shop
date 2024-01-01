import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/icons/t_circular_icon.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/features/shop/controllers/wishlist_controller.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class FavouriteScreen extends GetView<WishListController> {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Қалаулар тізімі',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () =>
                NavigationController.instance.selectedIndex.value = 0,
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.wishlistProducts.isEmpty) {
          return Center(
            child: Text(
              'Ешнәрсе табылмады',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: THelperFunctions.isDarkMode(context)
                        ? TColors.light
                        : TColors.dark,
                  ),
            ),
          );
        }
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                TGridLayout(
                  itemCount: controller.wishlistProducts.length,
                  itemBuilder: (_, index) => TProductCardVertical(
                      product: controller.wishlistProducts[index]),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
