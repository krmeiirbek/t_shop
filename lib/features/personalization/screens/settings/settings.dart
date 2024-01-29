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
import 'package:t_store/features/personalization/screens/profile/profile.dart';
import 'package:t_store/features/shop/screens/order/order.dart';
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
                      'Профиль',
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
                  const TSectionHeading(title: 'Аккаунт баптаулары', showActionButton: false),
                  SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(
                    icon: Iconsax.safe_home_outline,
                    title: 'Менің мекенжайларым',
                    subTitle: 'Жеткізу мекенжайын орнатыңыз',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.shopping_cart_outline,
                    title: 'Менің себетім',
                    subTitle: 'Өнімдерді қосыңыз, өшіріңіз және төлемге көшіңіз',
                    onTap: () => NavigationController.instance.selectedIndex.value = 2,
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.bag_tick_outline,
                    title: 'Менің тапсырыстарым',
                    subTitle: 'Аяқталмаған және орындалған тапсырыстар',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  // const TSettingsMenuTile(
                  //   icon: Iconsax.bank,
                  //   title: 'Менің банк карталарым',
                  //   subTitle: 'Тіркелген банк шотынан төлем жасау',
                  // ),
                  // const TSettingsMenuTile(
                  //   icon: Iconsax.discount_shape,
                  //   title: 'Менің купондарым',
                  //   subTitle: 'Барлық жеңілдік купондарының тізімі',
                  // ),
                  const TSettingsMenuTile(
                    icon: Iconsax.notification_1_outline,
                    title: 'Хабарландырулар',
                    subTitle: 'Кез келген хабарландырулар немесе ескертулер',
                  ),
                  const TSettingsMenuTile(
                    icon: Iconsax.security_card_outline,
                    title: 'Құпиялық саясаты & Пайдаланушы келісімі',
                    subTitle: 'Деректерді пайдалануды және олардың құпиялылығы туралы ақпараттар',
                  ),

                  /// --- App Settings
                  SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(
                    title: 'Байланыс',
                    showActionButton: false,
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),
                  const TSettingsMenuTile(
                    icon: EvaIcons.email,
                    title: 'zhet_market@support.kz',
                    subTitle: 'Байланыс үшін почтаға жазыңыз',
                  ),
                  const TSettingsMenuTile(
                    icon: Icons.call,
                    title: '+7747 555 0000',
                    subTitle: 'Байланыс үшін хабарласыңыз',
                  ),
                  const TSettingsMenuTile(
                    icon: Bootstrap.whatsapp,
                    title: '+7747 555 0000',
                    subTitle: 'Байланыс үшін whatsapp-қа жазыңыз',
                  ),
                  const TSettingsMenuTile(
                    icon: Bootstrap.telegram,
                    title: '+7747 555 0000',
                    subTitle: 'Байланыс үшін telegram-ға жазыңыз',
                  ),

                  /// --- Logout Button
                  SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => controller.logoutAccount(),
                      child: const Text('Шығу'),
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
