import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/products/cart/coupon_widget.dart';
import 'package:t_store/common/widgets/success_screen/success_screen.dart';
import 'package:t_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import 'widgets/billing_address_section.dart';
import 'widgets/billing_amount_section.dart';
import 'widgets/billing_payment_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Тапсырысты қарау',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Items in Cart
              const TCartItems(showAddRemoveButton: false),
              SizedBox(height: TSizes.spaceBtwSections),

              /// -- Coupon TextField
              const TCouponCode(),
              SizedBox(height: TSizes.spaceBtwSections),

              /// -- Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: Column(
                  children: [
                    /// Pricing
                    const TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    /// Divider
                    const Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    /// Payment Methods
                    const TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    /// Address
                    const TBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreen(
              image: TImages.successfulPaymentIcon,
              title: 'Төлем сәтті болды!',
              subtitle: 'Тауарыңыз жақын арада жөнелтіледі!',
              onPressed: () => Get.offAll(() => const NavigationMenu()),
            ),
          ),
          child: const Text('Төлем 256,0 ₸'),
        ),
      ),
    );
  }
}
