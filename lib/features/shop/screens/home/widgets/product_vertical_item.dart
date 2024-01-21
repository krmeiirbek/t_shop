import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ProductVerticalItem extends StatelessWidget {
  const ProductVerticalItem({
    super.key,
    this.futureMethod,
    required this.title,
  });

  final Future<List<ProductModel>>? futureMethod;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TSectionHeading(
          title: title,
          onPressed: () => Get.to(
            () => AllProducts(
              title: title,
              futureMethod: futureMethod,
            ),
          ),
        ),
        SizedBox(height: TSizes.spaceBtwItems),
        FutureBuilder<List<ProductModel>>(
          future: futureMethod,
          initialData: const <ProductModel>[],
          builder: (context, snapshot) {
            const loader = TVerticalProductShimmer();
            final empty = Center(
              child: Text(
                'Ешнәрсе табылмады',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.dark,
                    ),
              ),
            );
            final widget = TCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot,
              loader: loader,
              nothingFound: empty,
            );
            if (widget != null) return widget;

            var products = snapshot.data!;
            if (products.length > 4) {
              products = products.getRange(0, 4).toList();
            }
            return TGridLayout(
              itemBuilder: (_, index) => TProductCardVertical(product: products[index]),
              itemCount: products.length,
            );
          },
        ),
      ],
    );
  }
}
