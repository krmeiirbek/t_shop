import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:t_store/features/shop/models/category_model.dart';

class CatalogItem extends StatelessWidget {
  const CatalogItem({
    super.key,
    required this.category,
    this.onTap,
  });

  final CategoryModel category;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  const Icon(Iconsax.triangle_outline),
                  const SizedBox(width: 15),
                  Expanded(child: Text(category.nameKZ, overflow: TextOverflow.clip)),
                ],
              ),
            ),
            const Icon(Iconsax.arrow_right_outline),
          ],
        ),
      ),
    );
  }
}
