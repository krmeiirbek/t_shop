import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/controllers/product/cart_controller.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/pricing_calculator.dart';

class TBillingAmountSection extends GetView<CartController> {
  const TBillingAmountSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subTotal = controller.totalCartPrice.value;
    return Column(
      children: [
        /// Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(set.tr, style: Theme.of(context).textTheme.bodyMedium),
            Text('$subTotal ₸', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),

        /// Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(deliveryCache.tr, style: Theme.of(context).textTheme.bodyMedium),
            Text('${TPricingCalculator.calculateShippingCost(subTotal, 'KZ')} ₸', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),

        /// Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(taxLevy.tr, style: Theme.of(context).textTheme.bodyMedium),
            Text('${TPricingCalculator.calculateTax(subTotal, 'KZ')} ₸', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),

        /// Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(setOrder.tr, style: Theme.of(context).textTheme.bodyMedium),
            Text('${TPricingCalculator.calculateTotalPrice(subTotal, 'KZ')} ₸', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
