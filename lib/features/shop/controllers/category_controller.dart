import 'package:get/get.dart';
import 'package:t_store/data/repository/categories/category_repository.dart';
import 'package:t_store/data/repository/products/product_repository.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../models/product_model.dart';
import 'dummy_data.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  final allCategories = <CategoryModel>[].obs;
  final featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;
      final categories = await _categoryRepository.getCategories();
      allCategories.assignAll(categories);
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Әттегең ай!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// -- Load selected category data
  List<CategoryModel> getSubCategories(String categoryId) {
    // Fetch all categories where ParentId = categoryId;
    final subCategories = TDummyData.categories
        .where((category) => category.parentId == categoryId)
        .toList();
    return subCategories;
  }

  /// -- Get Sub-Category Products
  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryId, int limit = 4}) async {
    // Fetch limited (4) products against each subCategory;
    final products = await ProductRepository.instance
        .getProductsForCategory(categoryId: categoryId, limit: limit);
    return products;
  }
}
