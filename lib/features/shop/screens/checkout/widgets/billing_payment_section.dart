import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/product/checkout_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final checkoutController = Get.put(CheckoutController());
    return Column(
      children: [
        TSectionHeading(
          title: 'Төлем тәсілі',
          buttonTitle: 'Өзгерту',
          onPressed: () => checkoutController.selectPaymentMethod(context),
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),
        Obx(() => Row(
              children: [
                TRoundedContainer(
                  width: 60,
                  height: 35,
                  backgroundColor: dark ? TColors.light : TColors.white,
                  padding: EdgeInsets.all(TSizes.sm),
                  child: Image(
                    image: AssetImage(checkoutController.selectedPaymentMethod.value.image),
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: TSizes.spaceBtwItems / 2),
                Text(checkoutController.selectedPaymentMethod.value.name, style: Theme.of(context).textTheme.bodyLarge),
              ],
            )),
      ],
    );
  }
}
