import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:t_store/common/widgets/icons/t_circular_icon.dart';
import 'package:t_store/features/shop/controllers/product/cart_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TBottomAddToCart extends GetView<CartController> {
  const TBottomAddToCart({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    controller.updateAlreadyAddedProductCount(product);
    return Container(
      padding: EdgeInsets.only(
        left: TSizes.defaultSpace,
        right: TSizes.defaultSpace,
        top: TSizes.defaultSpace / 2,
        bottom: TSizes.defaultSpace,
      ),
      decoration: BoxDecoration(
        color: dark ? TColors.darkerGrey : TColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),
        ),
      ),
      child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  TCircularIcon(
                    icon: Iconsax.minus_outline,
                    backgroundColor: TColors.darkGrey,
                    width: 40,
                    height: 40,
                    color: TColors.white,
                    onPressed: () => controller.productQuantityInCart.value < 1 ? null : controller.productQuantityInCart.value--,
                  ),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Text(controller.productQuantityInCart.value.toString(), style: Theme.of(context).textTheme.titleSmall),
                  SizedBox(width: TSizes.spaceBtwItems),
                  TCircularIcon(
                    icon: Iconsax.add_outline,
                    backgroundColor: TColors.black,
                    width: 40,
                    height: 40,
                    color: TColors.white,
                    onPressed: () => controller.productQuantityInCart.value++,
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: controller.productQuantityInCart.value < 1 ? null : () => controller.addToCart(product),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(TSizes.md),
                  backgroundColor: TColors.black,
                  side: const BorderSide(color: TColors.black),
                ),
                child: Text(addToCart.tr),
              ),
            ],
          )),
    );
  }
}
