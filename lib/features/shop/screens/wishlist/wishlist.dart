import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/icons/t_circular_icon.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/loaders/animation_loader.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:t_store/features/shop/controllers/product/favourites_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          wishList.tr,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add_outline,
            onPressed: () => NavigationController.instance.selectedIndex.value = 1,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
              future: controller.favouriteProducts(),
              initialData: const <ProductModel>[],
              builder: (context, snapshot) {
                const loader = TVerticalProductShimmer(itemCount: 6);
                final emptyWidget = TAnimationLoaderWidget(
                  text: emptyWishList.tr,
                  animation: TImages.shoppingOptions,
                  showAction: true,
                  actionText: addSomething.tr,
                  onActionPressed: () => NavigationController.instance.selectedIndex.value = 0,
                );
                final widget = TCloudHelperFunctions.checkMultiRecordState(
                  snapshot: snapshot,
                  loader: loader,
                  nothingFoundWidget: emptyWidget,
                );
                if (widget != null) {
                  return widget;
                }
                final products = snapshot.data!;
                return TGridLayout(
                  itemCount: products.length,
                  itemBuilder: (_, index) => TProductCardVertical(product: products[index]),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
