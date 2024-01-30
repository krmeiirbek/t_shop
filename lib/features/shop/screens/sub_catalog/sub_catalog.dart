import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/catalog/catalog_item.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/localization/tr_constants.dart';

class SubCatalogScreen extends GetView<CategoryController> {
  const SubCatalogScreen({
    Key? key,
    required this.categoryId,
    required this.subCategories,
  }) : super(key: key);

  final String categoryId;
  final List<CategoryModel> subCategories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
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
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: subCategories.length,
                  itemBuilder: (_, index) => CatalogItem(
                    category: subCategories[index],
                    onTap: () => controller.goToSubCategoryOrProductsScreen(subCategories[index]),
                  ),
                  separatorBuilder: (_, index) => const Divider(indent: 35),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
