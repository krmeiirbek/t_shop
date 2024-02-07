import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/loaders/animation_loader.dart';
import 'package:t_store/features/shop/controllers/product/order_controller.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = OrderController.instance;
    return FutureBuilder(
      future: controller.fetchUserOrders(),
      builder: (context, snapshot) {
        final emptyWidget = TAnimationLoaderWidget(
          text: emptyCart.tr,
          animation: TImages.shoppingOptions,
          showAction: true,
          actionText: addSomething.tr,
          onActionPressed: () => NavigationController.instance.selectedIndex.value = 0,
        );
        final widget = TCloudHelperFunctions.checkMultiRecordState(
          snapshot: snapshot,
          nothingFoundWidget: emptyWidget,
        );
        if (widget != null) {
          return widget;
        }
        final orders = snapshot.data!;
        return ListView.separated(
          shrinkWrap: true,
          itemCount: orders.length,
          separatorBuilder: (_, __) => SizedBox(height: TSizes.spaceBtwItems),
          itemBuilder: (_, index) => TRoundedContainer(
            showBorder: true,
            padding: EdgeInsets.all(TSizes.md),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// -- Row 1
                Row(
                  children: [
                    /// 1 - Icon
                    const Icon(Iconsax.ship_outline),
                    SizedBox(width: TSizes.spaceBtwItems / 2),

                    /// 2 - Status & Date
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            orders[index].orderStatusText,
                            style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary, fontWeightDelta: 1),
                          ),
                          Text(orders[index].formattedOrderDate, style: Theme.of(context).textTheme.headlineSmall),
                        ],
                      ),
                    ),

                    /// 3 - Icon
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Iconsax.arrow_right_3_outline,
                        size: TSizes.iconSm,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: TSizes.spaceBtwItems),

                /// -- Row 2
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          /// 1 - Icon
                          const Icon(Iconsax.tag_outline),
                          SizedBox(width: TSizes.spaceBtwItems / 2),

                          /// 2 - Status & Date
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(order.tr, style: Theme.of(context).textTheme.labelMedium),
                                Text(orders[index].id, style: Theme.of(context).textTheme.titleMedium),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          /// 1 - Icon
                          const Icon(Iconsax.calendar_outline),
                          SizedBox(width: TSizes.spaceBtwItems / 2),

                          /// 2 - Status & Date
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(deliveryDate.tr, style: Theme.of(context).textTheme.labelMedium),
                                Text(orders[index].formattedDeliveryDate, style: Theme.of(context).textTheme.titleMedium),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
