import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ShowDialogs {
  static deleteShowDialog({required title, required onPressed, middleText = '', duration = 1}) {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(TSizes.md),
      title: title,
      titleStyle: Theme.of(Get.context!).textTheme.bodyLarge!.apply(fontStyle: FontStyle.normal, fontSizeDelta: 5),
      middleText: middleText,
      middleTextStyle: Theme.of(Get.context!).textTheme.bodyMedium!.apply(fontSizeDelta: 2),
      confirm: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
        child: Padding(padding: EdgeInsets.symmetric(horizontal: TSizes.lg), child: Text(deleteText.tr)),
      ),
      cancel: OutlinedButton(onPressed: () => Navigator.of(Get.overlayContext!).pop(), child: Text(cancelText.tr)),
    );
  }

  static logoutShowDialog({required title, required onPressed, middleText = '', duration = 1}) {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(TSizes.md),
      title: title,
      titleStyle: Theme.of(Get.context!).textTheme.bodyLarge!.apply(fontStyle: FontStyle.normal, fontSizeDelta: 5),
      middleText: middleText,
      middleTextStyle: Theme.of(Get.context!).textTheme.bodyMedium!.apply(fontSizeDelta: 2),
      confirm: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
        child: Padding(padding: EdgeInsets.symmetric(horizontal: TSizes.xs), child: Text(exitText.tr)),
      ),
      cancel: OutlinedButton(onPressed: () => Navigator.of(Get.overlayContext!).pop(), child: Text(cancelText.tr)),
    );
  }

  static classicShowDialog({required title, required onPressed, middleText = '', duration = 1}) {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(TSizes.md),
      title: title,
      titleStyle: Theme.of(Get.context!).textTheme.bodyLarge!.apply(fontStyle: FontStyle.normal, fontSizeDelta: 5),
      middleText: middleText,
      middleTextStyle: Theme.of(Get.context!).textTheme.bodyMedium!.apply(fontSizeDelta: 2),
      confirm: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: Colors.white, side: const BorderSide(color: Colors.white)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.xs),
          child: Text(yesText.tr, style: const TextStyle(color: Colors.black)),
        ),
      ),
      cancel: ElevatedButton(
        onPressed: () => Get.back(),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.white, side: const BorderSide(color: Colors.white)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.xs),
          child: Text(noText.tr, style: const TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}
