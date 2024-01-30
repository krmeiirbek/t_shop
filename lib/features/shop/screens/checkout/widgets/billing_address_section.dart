import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/controllers/address_controller.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TBillingAddressSection extends GetView<AddressController> {
  const TBillingAddressSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(
              title: deliveryAddress.tr,
              buttonTitle: change.tr,
              onPressed: () => controller.selectNewAddressPopup(context),
            ),
            controller.selectedAddress.value.id.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.selectedAddress.value.name, style: Theme.of(context).textTheme.bodyLarge),
                      SizedBox(height: TSizes.spaceBtwItems / 2),
                      Row(
                        children: [
                          const Icon(Icons.phone, color: Colors.grey, size: 16),
                          SizedBox(width: TSizes.spaceBtwItems),
                          Text(
                            controller.selectedAddress.value.phoneNumber,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      SizedBox(height: TSizes.spaceBtwItems / 2),
                      Row(
                        children: [
                          const Icon(Icons.location_history, color: Colors.grey, size: 16),
                          SizedBox(width: TSizes.spaceBtwItems),
                          Expanded(
                            child: Text(
                              controller.selectedAddress.value.toString(),
                              style: Theme.of(context).textTheme.bodyMedium,
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : Text(selectDeliveryAddress.tr, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ));
  }
}
