import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/personalization/controllers/address_controller.dart';
import 'features/personalization/controllers/user_controller.dart';
import 'features/personalization/screens/settings/settings.dart';
import 'features/shop/controllers/all_products_controller.dart';
import 'features/shop/controllers/banner_controller.dart';
import 'features/shop/controllers/brand_controller.dart';
import 'features/shop/controllers/category_controller.dart';
import 'features/shop/controllers/home_controller.dart';
import 'features/shop/controllers/product/cart_controller.dart';
import 'features/shop/controllers/product/checkout_controller.dart';
import 'features/shop/controllers/product/favourites_controller.dart';
import 'features/shop/controllers/product/images_controller.dart';
import 'features/shop/controllers/product/order_controller.dart';
import 'features/shop/controllers/product/product_controller.dart';
import 'features/shop/controllers/product/reviews_controller.dart';
import 'features/shop/controllers/product/variation_controller.dart';
import 'features/shop/controllers/story_controller.dart';
import 'features/shop/screens/cart/cart.dart';
import 'features/shop/screens/catalog/catalog.dart';
import 'features/shop/screens/home/home.dart';
import 'features/shop/screens/wishlist/wishlist.dart';
import 'localization/tr_constants.dart';
import 'utils/constants/colors.dart';
import 'utils/helpers/helper_functions.dart';

class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();
  final Rx<int> selectedIndex = 0.obs;

  @override
  void onInit() {
    Get.put(AddressController());
    Get.put(UserController());
    Get.put(ProductController());
    Get.put(FavouritesController());
    Get.put(ImagesController());
    Get.put(VariationController());
    Get.put(CartController());
    Get.put(CheckoutController());
    Get.put(OrderController());
    Get.put(ReviewsController());
    Get.put(AllProductsController());
    Get.put(BannerController());
    Get.put(BrandController());
    Get.put(CategoryController());
    Get.put(TStoryController());
    Get.put(HomeController());
    super.onInit();
  }

  final screens = [
    const HomeScreen(),
    const CatalogScreen(),
    const CartScreen(),
    const FavouriteScreen(),
    const SettingsScreen(),
  ];
}

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          items: [
            BottomNavigationBarItem(icon: const Icon(Icons.home_outlined), label: homeBottomText.tr),
            BottomNavigationBarItem(icon: const Icon(Icons.menu_outlined), label: categoryBottomText.tr),
            BottomNavigationBarItem(icon: const Icon(Icons.shopping_cart_outlined), label: cartBottomText.tr),
            BottomNavigationBarItem(icon: const Icon(Icons.favorite_outline), label: favoriteBottomText.tr),
            BottomNavigationBarItem(icon: const Icon(Icons.account_circle_outlined), label: profileBottomText.tr),
          ],
          unselectedFontSize: 10,
          selectedFontSize: 11,
          iconSize: 28,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: TColors.primary,
          unselectedItemColor: !dark ? TColors.black : TColors.white,
          backgroundColor: dark ? TColors.black : TColors.white,
          onTap: (index) {
            controller.selectedIndex.value = index;
          },
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}
