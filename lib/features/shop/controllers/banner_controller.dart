import 'package:get/get.dart';
import 'package:t_store/data/repository/banners/banner_repository.dart';
import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final banners = <BannerModel>[].obs;
  final _bannerRepository = Get.put(BannerRepository());

  void updatePageIndicator(int index) {
    carousalCurrentIndex.value = index;
  }

  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;
      final banners = await _bannerRepository.fetchBanners();
      this.banners.assignAll(banners);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Әттегең ай!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }
}