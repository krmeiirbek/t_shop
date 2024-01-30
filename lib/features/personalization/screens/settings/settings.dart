import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:t_store/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/personalization/screens/address/address.dart';
import 'package:t_store/features/personalization/screens/languages/language.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';
import 'package:t_store/features/shop/screens/order/order.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SettingsScreen extends GetView<UserController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Text(
                      profileText.tr,
                      style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                  TUserProfileTile(
                    onPressed: () => Get.to(() => const ProfileScreen()),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  TSectionHeading(title: accountSettingsText.tr, showActionButton: false),
                  SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(
                    icon: Iconsax.safe_home_outline,
                    title: myAddressesText.tr,
                    subTitle: setDeliveryAddressText.tr,
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.shopping_cart_outline,
                    title: myCartText.tr,
                    subTitle: myCartMessageText.tr,
                    onTap: () => NavigationController.instance.selectedIndex.value = 2,
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.bag_tick_outline,
                    title: myOrdersText.tr,
                    subTitle: myOrdersMessageText.tr,
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  TSettingsMenuTile(
                    icon: Bootstrap.globe,
                    title: languageText.tr,
                    subTitle: changeLanguageText.tr,
                    onTap: () => Get.to(() => const LanguageScreen()),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_card_outline,
                    title: privacyPolicyText.tr,
                    subTitle: privacyPolicyMessageText.tr,
                  ),

                  /// --- App Settings
                  SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(
                    title: contactText.tr,
                    showActionButton: false,
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(
                    icon: EvaIcons.email,
                    title: emailText.tr,
                    subTitle: emailMessageText.tr,
                  ),
                  TSettingsMenuTile(
                    icon: Icons.call,
                    title: contactPhone.tr,
                    subTitle: contactPhoneSubTitle.tr,
                  ),
                  TSettingsMenuTile(
                    icon: Bootstrap.whatsapp,
                    title: contactWhatsapp.tr,
                    subTitle: contactWhatsappSubTitle.tr,
                  ),
                  TSettingsMenuTile(
                    icon: Bootstrap.telegram,
                    title: contactTelegram.tr,
                    subTitle: contactTelegramSubTitle.tr,
                  ),

                  /// --- Logout Button
                  SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => controller.logoutAccount(),
                      child: Text(exitText.tr),
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
