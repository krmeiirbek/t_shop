import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/image/t_circular_image.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Дүкен', style: Theme.of(context).textTheme.headlineMedium),
        actions: [TCartCounterIcon(onPressed: () {})],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (_, innerBoxIsScrolled) => [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            floating: true,
            backgroundColor: THelperFunctions.isDarkMode(context)
                ? TColors.black
                : TColors.white,
            expandedHeight: 440,
            flexibleSpace: Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(), // 8705 642 2509
                shrinkWrap: true,
                children: [
                  SizedBox(height: TSizes.spaceBtwItems),
                  const TSearchContainer(
                    text: 'Дүкеннен іздеу',
                    showBackGround: false,
                    padding: EdgeInsets.zero,
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(
                    title: 'Таңдаулы брендтер',
                    onPressed: () {},
                  ),
                  SizedBox(height: TSizes.spaceBtwItems / 1.5),
                  TGridLayout(
                    itemCount: 4,
                    mainAxisExtent: 80,
                    itemBuilder: (_, index) => GestureDetector(
                      onTap: () {},
                      child: TRoundedContainer(
                        padding: EdgeInsets.all(TSizes.sm),
                        showBorder: true,
                        backgroundColor: Colors.transparent,
                        child: Row(
                          children: [
                            Flexible(
                              child: TCircularImage(
                                image: TImages.clothIcon,
                                backgroundColor: Colors.transparent,
                                overlayColor: THelperFunctions.isDarkMode(context)
                                    ? TColors.white
                                    : TColors.dark,
                              ),
                            ),
                            SizedBox(height: TSizes.spaceBtwItems / 2),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const TBrandTitleWithVerifiedIcon(
                                    title: 'Nike',
                                    brandTextSize: TextSizes.large,
                                  ),
                                  Text(
                                    '256 өнімдер',
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        body: Container(),
      ),
    );
  }
}
