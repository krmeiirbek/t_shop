import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/personalization/screens/settings/settings.dart';
import 'package:t_store/features/shop/screens/cart/cart.dart';
import 'package:t_store/features/shop/screens/home/home.dart';
import 'package:t_store/features/shop/screens/catalog/catalog.dart';
import 'package:t_store/features/shop/screens/wishlist/wishlist.dart';

import 'utils/constants/colors.dart';
import 'utils/helpers/helper_functions.dart';

class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();
  final Rx<int> selectedIndex = 0.obs;
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
        () => CurvedNavigationBar(
            index: controller.selectedIndex.value,
            height: 75.0,
            items: const <Widget>[
              Icon(Iconsax.home),
              Icon(Iconsax.shop),
              Icon(Iconsax.shopping_cart),
              Icon(Iconsax.heart),
              Icon(Iconsax.user),
            ],
            color: dark ? TColors.black : TColors.white,
            buttonBackgroundColor: dark ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),
            backgroundColor: Colors.transparent,
            animationCurve: Curves.easeOut,
            animationDuration: const Duration(milliseconds: 400),
            onTap: (index) {
              controller.selectedIndex.value = index;
            },
            letIndexChange: (index) => true,
          ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}
