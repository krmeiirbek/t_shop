import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:t_store/data/services/translation_service.dart';
import 'package:t_store/features/personalization/controllers/language_controller.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LanguageController());

    return Scaffold(
      appBar: AppBar(title: Text(changeLanguageText.tr)),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final languageCode = TranslationService().keys.keys.elementAt(index);
            final languageName = controller.languageNames[languageCode] ?? 'Unknown Language';
            return Obx(
              () => InkWell(
                onTap: () => controller.changeLocale(languageCode),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      languageName,
                      style: Theme.of(context).textTheme.bodyLarge!,
                      textAlign: TextAlign.center,
                    ),
                    if (languageCode == controller.currentLanguage.value) const SizedBox(width: 10),
                    if (languageCode == controller.currentLanguage.value) const Icon(Iconsax.verify_outline, color: TColors.primary),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: TranslationService().keys.length,
        ),
      ),
    );
  }
}
