import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/loaders/animation_loader.dart';
import 'package:t_store/features/shop/controllers/product/cart_controller.dart';
import 'package:t_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:t_store/features/shop/screens/checkout/checkout.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: false,
        title: Text(cart.tr, style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Obx(() {
        final emptyWidget = TAnimationLoaderWidget(
          text: emptyCart.tr,
          animation: TImages.shoppingOptions,
          showAction: true,
          actionText: addSomething.tr,
          onActionPressed: () => NavigationController.instance.selectedIndex.value = 0,
        );
        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),

            /// Items in Cart
            child: const TCartItems(),
          );
        }
      }),

      /// Checkout Button
      bottomNavigationBar: Obx(() {
        if (controller.cartItems.isEmpty) return const SizedBox();
        return Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutScreen()),
            child: Obx(() => Text('${payment.tr} ${controller.totalCartPrice.value} ₸')),
          ),
        );
      }),
    );
  }
}
