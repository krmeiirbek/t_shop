import 'package:get/get.dart';
import 'package:t_store/data/repository/products/product_repository.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/popups/loaders.dart';
import '../../models/product_model.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = ProductRepository.instance;
  final featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  Future<void> fetchFeaturedProducts() async {
    try {
      isLoading.value = true;
      final products = await productRepository.getFeaturedProducts();
      featuredProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: ohSnapText.tr, message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      return await productRepository.getAllFeaturedProducts();
    } catch (e) {
      TLoaders.errorSnackBar(title: ohSnapText.tr, message: e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> fetchAllProductsWithProductIds(List<String> productIds) async {
    try {
      return await productRepository.getAllProductsWithProductIds(productIds);
    } catch (e) {
      TLoaders.errorSnackBar(title: ohSnapText.tr, message: e.toString());
      return [];
    }
  }

  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    } else if (product.productType == ProductType.variable.toString()) {
      for (var variation in product.productVariations!) {
        double priceToConsider = (variation.salePrice != 0) ? variation.salePrice : variation.price;

        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }

        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        return '$smallestPrice ₸ - $largestPrice';
      }
    } else {
      return errorProductType.tr;
    }
  }

  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null) return null;
    if (originalPrice <= 0 || salePrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  String getProductStockStatus(ProductModel product) {
    return product.stock > 0 ? inStock.tr : outOfStock.tr;
  }
}
