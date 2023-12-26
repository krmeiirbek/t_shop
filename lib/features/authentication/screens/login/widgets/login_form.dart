import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/data/repository/authentication/authentication_repository.dart';
import 'package:t_store/features/authentication/controllers/login/login_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Padding(
      padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: GestureDetector(
        onTap: controller.signInWithGoogle,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: TColors.borderPrimary, width: 1.5),
            color: TColors.white,
          ),
          child: Obx(() {
            if (AuthenticationRepository.instance.loading.value) {
              return const Center(
                  child: CupertinoActivityIndicator(
                color: TColors.white,
              ));
            } else {
              return Row(
                children: [
                  SizedBox(width: TSizes.spaceBtwItems),
                  const TCircularImage(
                      image: TImages.google),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Text(
                    'Google-мен кіру',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              );
            }
          }),
        ),
      ),
    );
  }
}
