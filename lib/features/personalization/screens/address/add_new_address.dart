import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/personalization/controllers/address_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/validators/validation.dart';

class AddNewAddressScreen extends GetView<AddressController> {
  const AddNewAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Жаңа мекенжай қосу'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) => TValidator.validateEmptyText('Name', value),
                  controller: controller.name,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user_outline),
                    labelText: 'Аты',
                  ),
                ),
                SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                  validator: TValidator.validatePhoneNumber,
                  controller: controller.phoneNumber,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile_outline),
                    labelText: 'Телефон нөмірі',
                    prefixText: '+7',
                  ),
                ),
                SizedBox(height: TSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (value) => TValidator.validateEmptyText('Street', value),
                        controller: controller.street,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building_3_outline),
                          labelText: 'Көше',
                        ),
                      ),
                    ),
                    SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        validator: (value) => TValidator.validateEmptyText('HouseNumber', value),
                        controller: controller.houseNumber,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.code_outline),
                          labelText: 'Үй нөмері',
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
                        validator: (value) => TValidator.validateEmptyText('CityOrVillage', value),
                        controller: controller.cityOrVillage,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building_outline),
                          labelText: 'Қала н/е ауыл',
                        ),
                      ),
                    ),
                    SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        validator: (value) => TValidator.validateEmptyText('District', value),
                        controller: controller.district,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.activity_outline),
                          labelText: 'Аудан',
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
                    child: const Text('Сақтау'),
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
