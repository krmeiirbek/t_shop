import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/brand/brand_card.dart';
import 'package:t_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:t_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:t_store/features/shop/controllers/brand_controller.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';

class BrandProducts extends GetView<BrandController> {
  const BrandProducts({Key? key, required this.brand}) : super(key: key);

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text(brand.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TBrandCard(showBorder: true, brand: brand),
              SizedBox(height: TSizes.spaceBtwSections),
              FutureBuilder(
                future: controller.getBrandProducts(brand.id),
                initialData: const <ProductModel>[],
                builder: (context, snapshot) {
                  const loader = TVerticalProductShimmer();
                  final widget = TCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                    loader: loader,
                  );
                  if (widget != null) return widget;

                  final brandProducts = snapshot.data!;
                  return TSortableProducts(products: brandProducts);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
