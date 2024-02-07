import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/layouts/auto_scroll_grid_layout_horizontal.dart';
import 'package:t_store/common/widgets/layouts/grid_layout_horizontal.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:t_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ProductHorizontalItem extends StatelessWidget {
  const ProductHorizontalItem({
    super.key,
    this.futureMethod,
    this.autoScrollGrid = false,
    required this.title,
  });

  final Future<List<ProductModel>>? futureMethod;
  final String title;
  final bool autoScrollGrid;

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
        SizedBox(
          height: 288,
          child: FutureBuilder<List<ProductModel>>(
            future: futureMethod,
            initialData: const <ProductModel>[],
            builder: (context, snapshot) {
              const loader = TVerticalProductShimmer();
              final empty = Center(
                child: Text(
                  nothingFound.tr,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.dark,
                      ),
                ),
              );
              final widget = TCloudHelperFunctions.checkMultiRecordState(
                snapshot: snapshot,
                loader: loader,
                nothingFoundWidget: empty,
              );
              if (widget != null) return widget;

              var products = snapshot.data!;
              if (products.length > 4) {
                products = products.getRange(0, 4).toList();
              }
              return autoScrollGrid
                  ? AutoScrollGridViewHorizontal(
                      itemCount: products.length,
                      itemBuilder: (_, index) => TProductCardHorizontal(product: products[index]),
                    )
                  : TGridLayoutHorizontal(
                      itemBuilder: (_, index) => TProductCardHorizontal(product: products[index]),
                      itemCount: products.length,
                    );
            },
          ),
        ),
      ],
    );
  }
}
