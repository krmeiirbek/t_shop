import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();
  final selectedProductImage = ''.obs;

  List<String> getAllProductImages(ProductModel product) {
    Set<String> images = {};
    images.add(product.thumbnail);
    selectedProductImage.value = product.thumbnail;
    if (product.images != null) {
      images.addAll(product.images!);
    }
    if (product.productVariations != null) {
      images.addAll(product.productVariations!.map((variation) => variation.image));
    }
    return images.toList();
  }

  void showEnlargedImage(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: TSizes.defaultSpace * 2, horizontal: TSizes.defaultSpace),
              child: CachedNetworkImage(imageUrl: image),
            ),
            SizedBox(height: TSizes.spaceBtwSections),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                  onPressed: () => Get.back(),
                  child: Text(zhetClose.tr),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
