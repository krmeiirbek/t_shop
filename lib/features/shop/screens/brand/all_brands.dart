import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/brand/brand_card.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/shimmer/brands_shimmer.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/brand_controller.dart';
import 'package:t_store/features/shop/screens/brand/brand_products.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class AllBrandsScreen extends GetView<BrandController> {
  const AllBrandsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text(brand.tr), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              TSectionHeading(title: brands.tr, showActionButton: false),
              SizedBox(height: TSizes.spaceBtwItems),

              /// Brands
              Obx(
                () {
                  if (controller.isLoading.value) {
                    return const TBrandsShimmer();
                  }
                  if (controller.allBrands.isEmpty) {
                    return Center(
                      child: Text(
                        nothingFound.tr,
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                              color: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.dark,
                            ),
                      ),
                    );
                  }
                  return TGridLayout(
                    itemCount: controller.allBrands.length,
                    mainAxisExtent: 80,
                    itemBuilder: (context, index) => TBrandCard(
                      showBorder: true,
                      onTap: () => Get.to(
                        () => BrandProducts(
                          brand: controller.allBrands[index],
                        ),
                      ),
                      brand: controller.allBrands[index],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
