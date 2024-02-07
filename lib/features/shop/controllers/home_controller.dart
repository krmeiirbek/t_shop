import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repository/home/home_repository.dart';
import 'package:t_store/features/shop/controllers/banner_controller.dart';
import 'package:t_store/features/shop/controllers/product/product_controller.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_stories.dart';
import 'package:t_store/features/shop/screens/home/widgets/product_horizontal_item.dart';
import 'package:t_store/features/shop/screens/home/widgets/product_vertical_item.dart';
import 'package:t_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/popups/loaders.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final homeRepository = HomeRepository.instance;
  final bannerController = BannerController.instance;
  final productController = ProductController.instance;
  final loading = false.obs;
  final homeItems = <Widget>[].obs;

  @override
  void onInit() {
    fetchHomeItems();
    super.onInit();
  }

  Future<void> fetchHomeItems() async {
    try {
      loading.value = true;
      final homeItem = await homeRepository.fetchHomeItems();
      homeItems.assignAll(homeItem.pageItems.map(getItemFromString).toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: e.toString());
    } finally {
      loading.value = false;
    }
  }

  Widget getItemFromString(Map<String, dynamic> item) {
    switch (item['name']) {
      case 'banners':
        return Column(
          children: [
            TPromoSlider(
              futureMethod: bannerController.fetchBannersWithIds((item['items'] as List<dynamic>).map((e) => e.toString()).toList()),
              carousalCurrentIndex: 0.obs,
            ),
            SizedBox(height: TSizes.spaceBtwSections),
          ],
        );
      case 'verticalProducts':
        return Column(
          children: [
            ProductVerticalItem(
              futureMethod: productController.fetchAllProductsWithProductIds((item['items'] as List<dynamic>).map((e) => e.toString()).toList()),
              title: item['title'].toString(),
            ),
            SizedBox(height: TSizes.spaceBtwSections),
          ],
        );
      case 'horizontalProducts':
        return Column(
          children: [
            ProductHorizontalItem(
              futureMethod: productController.fetchAllProductsWithProductIds((item['items'] as List<dynamic>).map((e) => e.toString()).toList()),
              title: item['title'].toString(),
              autoScrollGrid: true,
            ),
            SizedBox(height: TSizes.spaceBtwSections),
          ],
        );
      case 'stories':
        return Column(
          children: [
            const THomeStories(),
            SizedBox(height: TSizes.spaceBtwSections),
          ],
        );
      default:
        return const SizedBox();
    }
  }
}
