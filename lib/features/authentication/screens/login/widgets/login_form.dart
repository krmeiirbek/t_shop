import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/data/repository/authentication/authentication_repository.dart';
import 'package:t_store/features/authentication/controllers/login/login_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Phone Number
            TextFormField(
              controller: controller.phoneNumberController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.call),
                labelText: TTexts.phoneNo,
                prefixText: "+7 ",
              ),
              validator: TValidator.validatePhoneNumber,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: TSizes.spaceBtwSections),

            /// Sign in button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (controller.loginFormKey.currentState!.validate() &
                      !AuthenticationRepository.instance.loading.value) {
                    controller.phoneAuthentication();
                  }
                },
                child: Obx(() {
                  if (AuthenticationRepository.instance.loading.value) {
                    return const Center(
                        child: CupertinoActivityIndicator(
                      color: TColors.white,
                    ));
                  } else {
                    return const Text(TTexts.tContinue);
                  }
                }),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
