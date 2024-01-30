import 'package:get/get.dart';
import 'package:t_store/data/repository/brands/brand_repository.dart';
import 'package:t_store/data/repository/products/product_repository.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../models/brand_model.dart';
import '../models/product_model.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  final _brandRepository = Get.put(BrandRepository());
  final featuredBrands = <BrandModel>[].obs;
  final allBrands = <BrandModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  Future<void> getFeaturedBrands() async {
    try {
      isLoading.value = true;
      final brands = await _brandRepository.getAllBrands();
      allBrands.assignAll(brands);
      featuredBrands.assignAll(brands.where((brand) => brand.isFeatured ?? false).take(4));
    } catch (e) {
      TLoaders.errorSnackBar(title: ohSnapText.tr, message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> getBrandProducts(String brandId, {int limit = -1}) async {
    try {
      final products = await ProductRepository.instance.getProductsForBrand(brandId: brandId, limit: limit);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: ohSnapText.tr, message: e.toString());
      return [];
    }
  }

  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      final brands = await _brandRepository.getBrandsForCategory(categoryId: categoryId);
      return brands;
    } catch (e) {
      TLoaders.errorSnackBar(title: ohSnapText.tr, message: e.toString());
      return [];
    }
  }
}
