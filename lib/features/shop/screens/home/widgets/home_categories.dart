import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:t_store/common/widgets/shimmer/category_shimmer.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Padding(
      padding: EdgeInsets.only(left: TSizes.defaultSpace),
      child: Column(
        children: [
          TSectionHeading(
            title: popularCategories.tr,
            showActionButton: false,
            textColor: TColors.white,
          ),
          SizedBox(height: TSizes.spaceBtwItems),
          Obx(() {
            if (controller.isLoading.value) {
              return const TCategoryShimmer();
            }
            if (controller.featuredCategories.isEmpty) {
              return Center(
                child: Text(
                  nothingFound.tr,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.dark,
                      ),
                ),
              );
            }
            return SizedBox(
              height: 80,
              child: ListView.builder(
                itemCount: controller.featuredCategories.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  final category = controller.featuredCategories[index];
                  return TVerticalImageText(
                    image: category.image,
                    title: category.nameKZ,
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
