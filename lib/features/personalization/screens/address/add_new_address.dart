import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/personalization/controllers/address_controller.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/validators/validation.dart';

class AddNewAddressScreen extends GetView<AddressController> {
  const AddNewAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(addNewAddress2Text.tr),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) => TValidator.validateEmptyText(nameText.tr, value),
                  controller: controller.name,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.user_outline),
                    labelText: nameText.tr,
                  ),
                ),
                SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                  validator: TValidator.validatePhoneNumber,
                  controller: controller.phoneNumber,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.mobile_outline),
                    labelText: phoneNumberText.tr,
                    prefixText: phoneNumberPrefixText.tr,
                  ),
                ),
                SizedBox(height: TSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (value) => TValidator.validateEmptyText(streetText.tr, value),
                        controller: controller.street,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.building_3_outline),
                          labelText: streetText.tr,
                        ),
                      ),
                    ),
                    SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        validator: (value) => TValidator.validateEmptyText(houseNumberText.tr, value),
                        controller: controller.houseNumber,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.code_outline),
                          labelText: houseNumberText.tr,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: TSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (value) => TValidator.validateEmptyText(cityOrVillageText.tr, value),
                        controller: controller.cityOrVillage,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.building_outline),
                          labelText: cityOrVillageText.tr,
                        ),
                      ),
                    ),
                    SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        validator: (value) => TValidator.validateEmptyText(districtText.tr, value),
                        controller: controller.district,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.activity_outline),
                          labelText: districtText.tr,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: TSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.addNewAddresses(),
                    child: Text(saveText.tr),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
