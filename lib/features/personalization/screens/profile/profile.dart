import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/icons/t_circular_icon.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/change_phone.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/formatters/formatter.dart';

import '../../controllers/user_controller.dart';
import 'widgets/change_name.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: SizedBox(
          width: double.infinity,
          child: Text(changeProfileText.tr),
        ),
      ),

      ///Body
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                ///Profile Picture
                const SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      TCircularIcon(
                        icon: Iconsax.user_outline,
                        size: 30,
                        width: 50,
                        height: 50,
                      ),
                    ],
                  ),
                ),

                /// Details
                SizedBox(height: TSizes.spaceBtwItems / 2),
                const Divider(),
                SizedBox(height: TSizes.spaceBtwItems),
                TSectionHeading(
                  title: aboutProfileInfoText.tr,
                  showActionButton: false,
                ),
                SizedBox(height: TSizes.spaceBtwItems),

                TProfileMenu(
                  onPressed: () => Get.to(() => const ChangeName()),
                  title: 'Аты',
                  value: controller.user.value.name,
                ),
                SizedBox(height: TSizes.spaceBtwItems),
                const Divider(),
                SizedBox(height: TSizes.spaceBtwItems),
                TSectionHeading(
                  title: privateInfoText.tr,
                  showActionButton: false,
                ),
                TProfileMenu(
                  onPressed: () => Get.to(() => const ChangePhone()),
                  title: phoneNumberText.tr,
                  value: TFormatter.formatPhoneNumber(controller.user.value.phoneNumber),
                ),
                const Divider(),
                SizedBox(height: TSizes.spaceBtwItems),
                Center(
                  child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: Text(
                      deleteAccountText.tr,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
