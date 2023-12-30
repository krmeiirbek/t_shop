import 'package:get/get.dart';
import 'package:t_store/data/repository/brands/brand_repository.dart';
import 'package:t_store/data/repository/products/product_repository.dart';
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
      featuredBrands.assignAll(
          brands.where((brand) => brand.isFeatured ?? false).take(4));
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Әттегең ай!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> getBrandProducts(String brandId) async {
    try {
      final products = await ProductRepository.instance
          .getProductsForBrand(brandId: brandId);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Әттегең ай!', message: e.toString());
      return [];
    }
  }
}
