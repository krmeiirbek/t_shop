import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/features/shop/screens/store/widgets/category_brands.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';

class TCategoryTab extends GetView<CategoryController> {
  const TCategoryTab({Key? key, required this.category}) : super(key: key);

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Brands
              CategoryBrands(category: category),
              SizedBox(height: TSizes.spaceBtwItems),

              /// -- Products
              FutureBuilder<List<ProductModel>>(
                  future:
                      controller.getCategoryProducts(categoryId: category.id),
                  initialData: const <ProductModel>[],
                  builder: (context, snapshot) {
                    final response =
                        TCloudHelperFunctions.checkMultiRecordState(
                            snapshot: snapshot,
                            loader: const TVerticalProductShimmer());
                    if (response != null) return response;
                    final products = snapshot.data!;
                    return Column(
                      children: [
                        TSectionHeading(
                          title: 'Сізге ұнауы мүмкін',
                          showActionButton: true,
                          onPressed: () => Get.to(
                            () => AllProducts(
                              title: category.name,
                              futureMethod: controller.getCategoryProducts(
                                categoryId: category.id,
                                limit: -1,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),
                        TGridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) =>
                              TProductCardVertical(product: products[index]),
                        ),
                        SizedBox(height: TSizes.spaceBtwSections),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
