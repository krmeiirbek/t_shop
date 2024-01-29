import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/app_bar_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/device/device_utility.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.usePrimaryBG = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
  });

  final Widget? title;
  final bool showBackArrow, usePrimaryBG;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return usePrimaryBG
        ? TAppBarContainer(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.md),
              child: AppBar(
                automaticallyImplyLeading: false,
                leading: showBackArrow
                    ? IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(
                          Iconsax.arrow_left_outline,
                          color: dark ? TColors.light : TColors.dark,
                        ),
                      )
                    : leadingIcon != null
                        ? IconButton(
                            onPressed: leadingOnPressed,
                            icon: Icon(
                              leadingIcon,
                              color: dark ? TColors.light : TColors.dark,
                            ),
                          )
                        : null,
                title: title,
                actions: actions,
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.md),
            child: AppBar(
              automaticallyImplyLeading: false,
              leading: showBackArrow
                  ? IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Iconsax.arrow_left_outline,
                        color: dark ? TColors.light : TColors.dark,
                      ),
                    )
                  : leadingIcon != null
                      ? IconButton(
                          onPressed: leadingOnPressed,
                          icon: Icon(
                            leadingIcon,
                            color: dark ? TColors.light : TColors.dark,
                          ),
                        )
                      : null,
              title: title,
              actions: actions,
            ),
          );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
