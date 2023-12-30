import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/brand/brand_show_case.dart';
import 'package:t_store/common/widgets/shimmer/boxes_shimmer.dart';
import 'package:t_store/common/widgets/shimmer/list_tile_shimmer.dart';
import 'package:t_store/features/shop/controllers/brand_controller.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';

class CategoryBrands extends GetView<BrandController> {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BrandModel>>(
        future: controller.getBrandsForCategory(category.id),
        initialData: const <BrandModel>[],
        builder: (context, snapshot) {
          final loader = Column(
            children: [
              const TListTileShimmer(),
              SizedBox(height: TSizes.spaceBtwItems),
              const TBoxesShimmer(),
              SizedBox(height: TSizes.spaceBtwItems),
            ],
          );
          final widget = TCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, loader: loader);
          if (widget != null) return widget;
          final brands = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index) {
              final brand = brands[index];
              return FutureBuilder<List<ProductModel>>(
                  future: controller.getBrandProducts(brand.id, limit: 3),
                  initialData: const <ProductModel>[],
                  builder: (context, snapshot) {
                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;
                    final products = snapshot.data!;
                    return TBrandShowcase(
                      brand: brand,
                      images: products.map((e) => e.thumbnail).toList(),
                    );
                  });
            },
          );
        });
  }
}
