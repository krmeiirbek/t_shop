import 'package:get/get.dart';
import 'package:t_store/data/repository/products/product_repository.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/popups/loaders.dart';
import '../../models/product_model.dart';
import '../../models/product_variation_model.dart';
import '../cart_controller.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  // Variables used to keep the selected features.
  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  final featuredProducts = <ProductModel>[].obs;
  RxInt cartQuantity = 0.obs;
  RxString variationStockStatus = ''.obs;
  RxMap selectedAttributes = {}.obs;
  RxString selectedProductImage = ''.obs;
  final favorites =
      <String, RxBool>{}.obs; // Contains [ProductId: true] Favourite Product
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  /// -- Initialize Products from your backend
  @override
  void onInit() {
    // Initialize your products from Firestore, SQL, Firebase, Local Storage etc
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
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

  /// -- Initialize already added Item's Count in the cart.
  void initializeAlreadyAddedProductCount(ProductModel product) {
    // If product has no variations then calculate cartEntries and display total number.
    // Else make default entries to 0 and show cartEntries when variation is selected.
    if (product.productVariations == null ||
        product.productVariations!.isEmpty) {
      cartQuantity.value = CartController.instance
          .calculateSingleProductCartEntries(product.id, '');
    } else {
      // Get selected Variation if any...
      final variationId = selectedVariation.value.id;
      if (variationId.isNotEmpty) {
        cartQuantity.value = CartController.instance
            .calculateSingleProductCartEntries(product.id, variationId);
      } else {
        cartQuantity.value = 0;
      }
    }
  }

  /// -- Get Single Price Or Price Range in case of variations $5 - $29.99
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // If no variation exist return simple price OR sale price
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      // Calculate the smallest and largest prices
      for (var variation in product.productVariations!) {
        // Check if sale price exist
        double priceToConsider =
            (variation.salePrice != 0) ? variation.salePrice : variation.price;

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

  /// -- Add selected variation to cart
  void addProductToCart(ProductModel product) {
    // Product do not have any variations, Simply add to cart
    if (product.productVariations == null) {
      CartController.instance.addMultipleItemsToCart(
          product, ProductVariationModel.empty(), cartQuantity.value);
      Get.back();
    } else {
      final variation = selectedVariation.value;
      if (variation.id.isEmpty) {
        Get.snackbar('Select Variation',
            'To add items in the cart you first have to select a Variation of this product.',
            snackPosition: SnackPosition.BOTTOM);
        return;
      } else {
        CartController.instance
            .addMultipleItemsToCart(product, variation, cartQuantity.value);
        Get.back();
      }
    }
  }

  /// --------------------------- Favourites -------------------------------///

  /// Method to check if a product is selected (favorite)
  bool isFavourite(String productId) {
    return favorites[productId]?.value ?? false;
  }

  /// -- Add Product to Favourites
  void toggleFavoriteProduct(String productId) {
    // If favourites do not have this product, Add. Else Toggle
    if (!favorites.containsKey(productId)) {
      favorites[productId] = true.obs;
    } else {
      favorites[productId]!.value = !favorites[productId]!.value;
    }
  }

  /// Method to get the list of favorite products
  List<ProductModel> favoriteProducts() {
    return featuredProducts
        .where((product) => isFavourite(product.id))
        .toList();
  }
}
