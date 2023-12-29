import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/chips/choice_chip.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/product/variation_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = THelperFunctions.isDarkMode(context);

    return Obx(() => Column(
          children: [
            /// -- Selected Attribute Pricing & Description
            if (controller.selectedVariation.value.id.isNotEmpty)
              TRoundedContainer(
                padding: EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
                child: Column(
                  children: [
                    /// Title, Price, & Stock Status
                    Row(
                      children: [
                        const TSectionHeading(
                          title: 'Өзгеріс',
                          showActionButton: false,
                        ),
                        SizedBox(width: TSizes.spaceBtwItems),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const TProductTitleText(
                                  title: 'Бағасы : ',
                                  smallSize: true,
                                ),

                                /// Actual Price
                                if (controller
                                        .selectedVariation.value.salePrice >
                                    0)
                                  Text(
                                    '${controller.selectedVariation.value.price} ₸',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .apply(
                                            decoration:
                                                TextDecoration.lineThrough),
                                  ),
                                if (controller
                                        .selectedVariation.value.salePrice >
                                    0)
                                  SizedBox(width: TSizes.spaceBtwItems),

                                /// Sale Price
                                TProductPriceText(
                                    price: controller.getVariationPrice()),
                              ],
                            ),

                            /// Stock
                            Row(
                              children: [
                                const TProductTitleText(
                                  title: 'Статус : ',
                                  smallSize: true,
                                ),
                                Text(
                                  controller.variationStockStatus.value,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),

                    /// Variation Description
                    TProductTitleText(
                      title:
                          controller.selectedVariation.value.description ?? '',
                      smallSize: true,
                      maxLines: 4,
                    ),
                  ],
                ),
              ),
            SizedBox(height: TSizes.spaceBtwItems),

            /// -- Attributes
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: product.productAttributes!
                  .map(
                    (attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TSectionHeading(
                          title: attribute.name ?? '',
                          showActionButton: false,
                        ),
                        SizedBox(width: TSizes.spaceBtwItems / 2),
                        Obx(() => Wrap(
                              spacing: 8,
                              children: attribute.values!.map(
                                (attributeValue) {
                                  final isSelected = controller
                                          .selectedAttributes[attribute.name] ==
                                      attributeValue;
                                  final available = controller
                                      .getAttributesAvailabilityInVariation(
                                          product.productVariations!,
                                          attribute.name!)
                                      .contains(attributeValue);
                                  return TChoiceChip(
                                    text: attributeValue,
                                    selected: isSelected,
                                    onSelected: available
                                        ? (selectedValue) {
                                            if (selectedValue && available) {
                                              controller.onAttributeSelected(
                                                  product,
                                                  attribute.name ?? '',
                                                  attributeValue);
                                            }
                                          }
                                        : null,
                                  );
                                },
                              ).toList(),
                            )),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ],
        ));
  }
}
