import 'package:get/get.dart';
import 'package:t_store/data/repository/categories/category_repository.dart';
import 'package:t_store/data/repository/products/product_repository.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/features/shop/screens/sub_catalog/sub_catalog.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/utils/popups/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = CategoryRepository.instance;
  final _productRepository = ProductRepository.instance;
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
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: ohSnapText.tr, message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final subCategories = await _categoryRepository.getSubCategories(categoryId);
      return subCategories;
    } catch (e) {
      return [];
    }
  }

  Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async {
    final products = await _productRepository.getProductsForCategory(categoryId: categoryId, limit: limit);
    return products;
  }

  Future<void> goToSubCategoryOrProductsScreen(CategoryModel category) async {
    try {
      isLoading.value = true;
      final subCategories = await getSubCategories(category.id);
      if (subCategories.isNotEmpty) {
        Get.to(
          () => SubCatalogScreen(categoryId: category.id, subCategories: subCategories),
          preventDuplicates: false,
        );
      } else {
        Get.to(
          () => AllProducts(
            title: category.nameKZ,
            futureMethod: _productRepository.getProductsWithCategoryId(category.id),
          ),
        );
      }
    } catch (e) {
      TLoaders.warningSnackBar(title: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
