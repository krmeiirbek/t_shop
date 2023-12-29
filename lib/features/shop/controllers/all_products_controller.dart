import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repository/products/product_repository.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../models/product_model.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  // Variables used to keep the selected features.
  final products = <ProductModel>[].obs;
  final selectedSortOption = 'Аты'.obs;
  final selectedFilter = ''.obs;
  final repository = ProductRepository.instance;

  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try {
      if (query == null) return [];
      final products = await repository.fetchProductsByQuery(query);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Әттегең ай!', message: e.toString());
      return [];
    }
  }

  void assignProducts(List<ProductModel> products) {
    // Assign products to the 'products' list
    this.products.value = products;
    sortProducts('Аты');
  }

  void sortProducts(String sortOption) {
    selectedSortOption.value = sortOption;

    switch (sortOption) {
      case 'Аты':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Ең қымбаты':
        products.sort((a, b) {
          if (a.salePrice > 0 && b.salePrice > 0) {
            return b.salePrice.compareTo(a.salePrice);
          } else if (a.salePrice > 0) {
            return b.price.compareTo(a.salePrice);
          } else if (b.salePrice > 0) {
            return b.salePrice.compareTo(a.price);
          } else {
            return b.price.compareTo(a.price);
          }
        });
        break;
      case 'Ең арзаны':
        products.sort((a, b) {
          if (b.salePrice > 0 && a.salePrice > 0) {
            return a.salePrice.compareTo(b.salePrice);
          } else if (b.salePrice > 0) {
            return a.price.compareTo(b.salePrice);
          } else if (a.salePrice > 0) {
            return a.salePrice.compareTo(b.price);
          } else {
            return a.price.compareTo(b.price);
          }
        });
        break;
      case 'Ең жаңасы':
        products.sort((a, b) => a.date!.compareTo(b.date!));
        break;
      case 'Сатылым саны':
        products.sort((a, b) {
          if (b.salePrice > 0) {
            return b.salePrice.compareTo(a.salePrice);
          } else if (a.salePrice > 0) {
            return -1;
          }
          return 1;
        });
        break;
      default:
        // Default sorting option: Name
        products.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  void applyFilter(String filter) {
    selectedFilter.value = filter;
    // Apply a filter to the 'products' list based on the selected filter
  }
}
