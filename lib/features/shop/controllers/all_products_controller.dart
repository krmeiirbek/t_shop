import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repository/products/product_repository.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../models/product_model.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  final products = <ProductModel>[].obs;
  final selectedSortOption = sortableProductsName.tr.obs;
  final selectedFilter = ''.obs;
  final repository = ProductRepository.instance;

  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try {
      if (query == null) return [];
      final products = await repository.fetchProductsByQuery(query);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: ohSnapText.tr, message: e.toString());
      return [];
    }
  }

  void assignProducts(List<ProductModel> products) {
    this.products.value = products;
    sortProducts(sortableProductsName.tr);
  }

  void sortProducts(String sortOption) {
    selectedSortOption.value = sortOption;

    if (sortOption == sortableProductsName.tr) {
      sortOption = sortableProductsName;
    } else if (sortOption == sortableProductsExpensive.tr) {
      sortOption = sortableProductsExpensive;
    } else if (sortOption == sortableProductsCheap.tr) {
      sortOption = sortableProductsCheap;
    }

    switch (sortOption) {
      case sortableProductsName:
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case sortableProductsExpensive:
        products.sort(
          (a, b) {
            if (a.salePrice > 0 && b.salePrice > 0) {
              return b.salePrice.compareTo(a.salePrice);
            } else if (a.salePrice > 0) {
              return b.price.compareTo(a.salePrice);
            } else if (b.salePrice > 0) {
              return b.salePrice.compareTo(a.price);
            } else {
              return b.price.compareTo(a.price);
            }
          },
        );
        break;
      case sortableProductsCheap:
        products.sort(
          (a, b) {
            if (b.salePrice > 0 && a.salePrice > 0) {
              return a.salePrice.compareTo(b.salePrice);
            } else if (b.salePrice > 0) {
              return a.price.compareTo(b.salePrice);
            } else if (a.salePrice > 0) {
              return a.salePrice.compareTo(b.price);
            } else {
              return a.price.compareTo(b.price);
            }
          },
        );
        break;
      default:
        products.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  void applyFilter(String filter) {
    selectedFilter.value = filter;
  }
}
