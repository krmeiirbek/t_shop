import 'package:get/get.dart';
import 'package:t_store/data/repository/products/product_repository.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/popups/loaders.dart';
import '../../models/product_model.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
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
      TLoaders.errorSnackBar(title: 'Әттегең ай!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      return await productRepository.getAllFeaturedProducts();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Әттегең ай!', message: e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> fetchAllProductsWithProductIds(List<String> productIds) async {
    try {
      return await productRepository.getAllProductsWithProductIds(productIds);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Әттегең ай!', message: e.toString());
      return [];
    }
  }

  /// -- Get Single Price Or Price Range in case of variations $5 - $29.99
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // If no variation exist return simple price OR sale price
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    } else if (product.productType == ProductType.variable.toString()) {
      // Calculate the smallest and largest prices
      for (var variation in product.productVariations!) {
        // Check if sale price exist
        double priceToConsider = (variation.salePrice != 0) ? variation.salePrice : variation.price;

        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }

        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }
      // If smallest and largest are same. Return single price.
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        return '$smallestPrice ₸ - $largestPrice';
      }
    } else {
      return 'Қате ProductType';
    }
  }

  /// -- Calculate Discount Percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null) return null;
    if (originalPrice <= 0 || salePrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  /// -- Check Product Stock Status
  String getProductStockStatus(ProductModel product) {
    return product.stock > 0 ? 'Қоймада бар' : 'Қоймада жоқ';
  }
}
