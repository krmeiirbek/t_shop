import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/shop/checkout/checkout.dart';
import 'package:t_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:t_store/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Себет', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),

          /// Items in Cart
          child: const TCartItems()
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckoutScreen()),
          child: const Text('Төлем 256,0 ₸'),
        ),
      ),
    );
  }
}