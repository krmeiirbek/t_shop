import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/products/cart/add_remove_button.dart';
import 'package:t_store/common/widgets/products/cart/cart_item.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/features/shop/controllers/product/cart_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TCartItems extends GetView<CartController> {
  const TCartItems({Key? key, this.showAddRemoveButton = true}) : super(key: key);

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) => SizedBox(height: TSizes.spaceBtwSections),
          itemCount: controller.cartItems.length,
          itemBuilder: (_, index) => Obx(
            () {
              final item = controller.cartItems[index];
              return Column(
                children: [
                  TCartItem(cartItem: item),
                  if (showAddRemoveButton) SizedBox(height: TSizes.spaceBtwItems),
                  if (showAddRemoveButton)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 70),
                            TProductQuantityWithAddRemoveButton(
                              quantity: item.quantity,
                              add: () => controller.addOneToCart(item),
                              remove: () => controller.removeOneFromCart(item),
                            ),
                          ],
                        ),
                        TProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1)),
                      ],
                    ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
