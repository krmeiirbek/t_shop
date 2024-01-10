import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/catalog/catalog_item.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';

class SubCatalogScreen extends GetView<CategoryController> {
  const SubCatalogScreen({Key? key, required this.categoryId}) : super(key: key);

  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const TSearchContainer(
          text: 'Дүкеннен іздеу',
          showBackGround: false,
          padding: EdgeInsets.zero,
        ),
      ),
      body: FutureBuilder<List<CategoryModel>>(
          future: controller.getSubCategories(categoryId),
          initialData: const [],
          builder: (context, snapshot) {
            final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
            if (widget != null) return widget;
            final subCategories = snapshot.data!;
            return Column(
              children: [
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: subCategories.length,
                    itemBuilder: (_, index) => CatalogItem(category: subCategories[index]),
                    separatorBuilder: (_, index) => const Divider(indent: 35),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
