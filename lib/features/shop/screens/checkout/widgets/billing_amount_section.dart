import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Жиынтық', style: Theme.of(context).textTheme.bodyMedium),
            Text('256.0 ₸', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),

        /// Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Жеткізу ақысы', style: Theme.of(context).textTheme.bodyMedium),
            Text('6.0 ₸', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),

        /// Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Салық алымы', style: Theme.of(context).textTheme.bodyMedium),
            Text('6.0 ₸', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),

        /// Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Тапсырыс жиынтығы', style: Theme.of(context).textTheme.bodyMedium),
            Text('256.0 ₸', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}