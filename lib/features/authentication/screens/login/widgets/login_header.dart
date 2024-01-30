import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(
            dark ? TImages.darkAppLogo2 : TImages.lightAppLogo2,
          ),
        ),
        Text(
          welcomeText.tr,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: TSizes.sm),
        Text(
          discoverEndlessChoicesText.tr,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
