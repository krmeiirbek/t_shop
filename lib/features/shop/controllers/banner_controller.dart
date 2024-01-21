import 'package:get/get.dart';
import 'package:t_store/data/repository/banners/banner_repository.dart';
import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  final isLoading = false.obs;
  final _bannerRepository = Get.put(BannerRepository());

  Future<List<BannerModel>> fetchBannersWithIds(List<String> bannerIds) async {
    try {
      isLoading.value = true;
      final banners = await _bannerRepository.fetchBannersWithIds(bannerIds);
      return banners;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Әттегең ай!', message: e.toString());
      return [];
    } finally {
      isLoading.value = false;
    }
  }
}
