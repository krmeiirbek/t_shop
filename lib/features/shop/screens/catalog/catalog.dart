import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:t_store/common/widgets/catalog/catalog_item.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/utils/constants/colors.dart';

class CatalogScreen extends GetView<CategoryController> {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.allCategories;
    return Scaffold(
      appBar: AppBar(
        title: TSearchContainer(
          text: searchFromStore.tr,
          showBackGround: false,
          padding: EdgeInsets.zero,
        ),
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              const SizedBox(height: 20),
              Expanded(
                child: LiquidPullToRefresh(
                  color: TColors.primary,
                  showChildOpacityTransition: false,
                  onRefresh: controller.fetchCategories,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: categories.length,
                    itemBuilder: (_, index) => CatalogItem(
                      category: categories[index],
                      onTap: () => controller.goToSubCategoryOrProductsScreen(categories[index]),
                    ),
                    separatorBuilder: (_, index) => const Divider(indent: 35),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
