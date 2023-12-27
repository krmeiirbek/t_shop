import 'package:get/get.dart';
import 'package:t_store/data/repository/categories/category_repository.dart';
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
  List<CategoryModel> getFeaturedCategories(int take) {
    // Get Featured Brands from your data source
    return TDummyData.categories
        .where((category) => category.isFeatured)
        .take(take)
        .toList();
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
  List<ProductModel> getSubCategoryProducts(String subCategoryId, int take) {
    // Fetch limited (4) products against each subCategory;
    final products = TDummyData.products
        .where((product) => product.categoryId == subCategoryId)
        .take(take)
        .toList();
    return products;
  }
}
