import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/personalization/controllers/update_phone_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/validators/validation.dart';

class ChangePhone extends StatelessWidget {
  const ChangePhone({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdatePhoneController());
    return Scaffold(
      /// Custom Appbar
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Телефон нөмерін өзгерту',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(
              'Телефон нөмеріңізді +71234567890 форматында енгізіңіз',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: TSizes.spaceBtwSections),

            /// Text field and Button
            Form(
              key: controller.updateUserPhoneNumberFormKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) => TValidator.validatePhoneNumber(value),
                    expands: false,
                    controller: controller.phoneNumber,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Телефон нөмері',
                      prefixIcon: Icon(Iconsax.user_edit),
                      prefixText: '+7',
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (controller.updateUserPhoneNumberFormKey.currentState!
                      .validate()) {
                    controller.updatePhoneNumber();
                  }
                },
                child: const Text('Сақтау'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
