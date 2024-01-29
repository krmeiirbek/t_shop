import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/personalization/controllers/update_name_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      /// Custom App Bar
      appBar: TAppBar(
        showBackArrow: true,
        title: SizedBox(
          width: double.infinity,
          child: Text(
            'Атын өзгерту',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            ///Headings
            Text(
              'Оңай растау үшін нақты атауды пайдаланыңыз. Бұл атау бірнеше бетте пайда болады.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: TSizes.spaceBtwSections),

            /// Text Field and Button
            Form(
                key: controller.updateUserNameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.nameController,
                      validator: (value) =>
                          TValidator.validateEmptyText('Аты', value),
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: TTexts.firstName,
                        prefixIcon: Icon(Iconsax.user_outline),
                      ),
                    ),
                  ],
                )),

            SizedBox(height: TSizes.spaceBtwSections),

            ///Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUserName(),
                child: const Text('Сақтау'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
