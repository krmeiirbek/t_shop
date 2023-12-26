import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/icons/t_circular_icon.dart';
import 'package:t_store/common/widgets/shimmer/shimmer.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/formatters/formatter.dart';

class TUserProfileTile extends GetView<UserController> {
  const TUserProfileTile({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.profileLoading.value) {
          return Row(
            children: [
              SizedBox(width: TSizes.defaultSpace),
              const TShimmerEffect(width: 60, height: 60),
              SizedBox(width: TSizes.spaceBtwItems),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TShimmerEffect(width: 200, height: 20),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  const TShimmerEffect(width: 150, height: 18),
                ],
              ),
            ],
          );
        } else {
          return ListTile(
            leading: const TCircularIcon(
              icon: Iconsax.user,
              size: 30,
              width: 50,
              height: 50,
            ),
            title: Text(
              controller.user.value.name,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: TColors.white),
            ),
            subtitle: Text(
              TFormatter.formatPhoneNumber(controller.user.value.phoneNumber),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: TColors.white),
            ),
            trailing: IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Iconsax.edit,
                color: TColors.white,
              ),
            ),
          );
        }
      },
    );
  }
}
