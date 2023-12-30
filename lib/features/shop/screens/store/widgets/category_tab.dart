import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/brand/brand_show_case.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
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
              const TBrandShowcase(
                images: [
                  TImages.productImage3,
                  TImages.productImage2,
                  TImages.productImage1,
                ],
              ),
              const TBrandShowcase(
                images: [
                  TImages.productImage3,
                  TImages.productImage2,
                  TImages.productImage1,
                ],
              ),
              SizedBox(height: TSizes.spaceBtwItems),

              /// -- Products
              TSectionHeading(
                title: 'Сізге ұнауы мүмкін',
                showActionButton: true,
                onPressed: () {},
              ),
              SizedBox(height: TSizes.spaceBtwItems),

              // TGridLayout(
              //   itemCount: 4,
              //   itemBuilder: (_, index) =>
              //       TProductCardVertical(product: ProductModel.empty()),
              // ),
              SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
