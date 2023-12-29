import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/features/shop/controllers/all_products_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key, required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          value: controller.selectedSortOption.value,
          items: [
            'Аты',
            'Ең қымбаты',
            'Ең арзаны',
            'Сатылым саны',
            'Ең жаңасы',
            'Танымалдығы',
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
          onChanged: (value) {
            controller.sortProducts(value!);
          },
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
        ),
        SizedBox(height: TSizes.spaceBtwSections),

        /// Products
        Obx(() => TGridLayout(
          itemCount: controller.products.length,
          itemBuilder: (_, index) =>
              TProductCardVertical(product: controller.products[index]),
        )),
      ],
    );
  }
}
