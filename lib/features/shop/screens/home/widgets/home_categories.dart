import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/sub_category/sub_category.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: TSizes.defaultSpace),
      child: Column(
        children: [
          const TSectionHeading(
            title: 'Танымал категориялар',
            showActionButton: false,
            textColor: TColors.white,
          ),
          SizedBox(height: TSizes.spaceBtwItems),
          SizedBox(
            height: 80,
            child: ListView.builder(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return TVerticalImageText(
                  image: TImages.sportIcon,
                  title: 'Спорт',
                  onTap: () => Get.to(() => const SubCategoriesScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
