import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/appbar/tabbar.dart';
import 'package:t_store/common/widgets/brand/brand_card.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import 'widgets/category_tab.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title:
              Text('Дүкен', style: Theme.of(context).textTheme.headlineMedium),
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
                  physics: const NeverScrollableScrollPhysics(),
                  // 8705 642 2509
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
                      itemBuilder: (_, index) =>
                          const TBrandCard(showBorder: false),
                    ),
                  ],
                ),
              ),
              bottom: const TTabBar(tabs: [
                Tab(child: Text('Спорт')),
                Tab(child: Text('Жиһаз')),
                Tab(child: Text('Электроника')),
                Tab(child: Text('Киім')),
                Tab(child: Text('Косметика')),
              ]),
            ),
          ],
          body: TabBarView(
            children: [
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
