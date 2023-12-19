import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:t_store/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
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
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white),
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                  const TUserProfileTile(),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeading(
                      title: 'Аккаунт баптаулары', showActionButton: false),
                  SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'Менің мекенжайларым',
                    subTitle: 'Жеткізу мекенжайын орнатыңыз',
                    onTap: () {},
                  ),
                  const TSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'Менің қоржыным',
                    subTitle:
                        'Өнімдерді қосыңыз, өшіріңіз және төлемге көшіңіз',
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'Менің тапсырыстарым',
                    subTitle: 'Аяқталмаған және орындалған тапсырыстар',
                    onTap: () {},
                  ),
                  const TSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: 'Менің банк карталарым',
                    subTitle: 'Тіркелген банк шотынан төлем жасау',
                  ),
                  const TSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'Менің купондарым',
                    subTitle: 'Барлық жеңілдік купондарының тізімі',
                  ),
                  const TSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Хабарландырулар',
                    subTitle: 'Кез келген хабарландырулар немесе ескертулер',
                  ),
                  const TSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Құпиялық саясаты & Пайдаланушы келісімі',
                    subTitle:
                        'Деректерді пайдалануды және олардың құпиялылығы туралы ақпараттар',
                  ),

                  /// --- App Settings
                  SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(
                    title: 'Қолданба баптаулары',
                    showActionButton: false,
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),
                  const TSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Деректерді жүктеу',
                    subTitle: 'Деректерді бұлтқа жүктеп салыңыз',
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Геолокация',
                    subTitle: 'Орналасқан жеріңізді анықтауға рұқсат беріңіз',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD сурет сапасы',
                    subTitle:
                        'Көрінетін сурет сапасын орнатыңыз, бұл қосулы болса жүктелуде кідіріс болуы мүмкін',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  /// --- Logout Button
                  SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
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
