import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/brand/brand_card.dart';
import 'package:t_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:t_store/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Nike'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Detail
              const TBrandCard(showBorder: true),
              SizedBox(height: TSizes.spaceBtwSections),

              const TSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
