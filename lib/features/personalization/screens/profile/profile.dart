import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/icons/t_circular_icon.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/change_phone.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
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
      appBar: const TAppBar(
        showBackArrow: true,
        title: SizedBox(
          width: double.infinity,
          child: Text('Профильді өзгерту'),
        ),
      ),

      ///Body
      body: Obx(() => SingleChildScrollView(
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
                      icon: Iconsax.user,
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
              const TSectionHeading(
                title: 'Профиль туралы ақпарат',
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
              const TSectionHeading(
                title: 'Жеке ақпарат',
                showActionButton: false,
              ),
              TProfileMenu(
                onPressed: () => Get.to(() => const ChangePhone()),
                title: 'Телефон нөмірі',
                value: TFormatter.formatPhoneNumber(controller.user.value.phoneNumber),
              ),
              const Divider(),
              SizedBox(height: TSizes.spaceBtwItems),
              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    'Есептік жазбаны жою',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
