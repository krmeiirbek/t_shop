import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repository/products/product_repository.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/local_storage/storage_utility.dart';

class WishListController extends GetxController {
  static WishListController get instance => Get.find();
  final wishlistProductIds = [].obs;
  final wishlistProducts = <ProductModel>[].obs;
  final _localStorage = TLocalStorage();
  final isLoading = false.obs;

  @override
  void onReady() async {
    await fetchWishlistProducts();
    super.onReady();
  }

  Future<void> fetchWishlistProducts() async {
    try {
      isLoading.value = true;
      await fetchWishlistProductIds();
      if (wishlistProductIds.isEmpty) {
        return;
      }
      final query = FirebaseFirestore.instance
          .collection('Products')
          .where(FieldPath.documentId, whereIn: wishlistProductIds);
      wishlistProducts.value =
          await ProductRepository.instance.fetchProductsByQuery(query);

    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchWishlistProductIds() async {
    await _localStorage.writeIfNull('WishlistProductIds', []);
    wishlistProductIds(_localStorage.readData('WishlistProductIds'));
  }

  Future<void> addOrRemoveWishlistProductId(String productId) async {
    try {
      isLoading.value = true;
      List<dynamic> wishlist =
          _localStorage.readData('WishlistProductIds') ?? [];
      if (wishlist.contains(productId)) {
        wishlist.remove(productId);
        wishlistProducts.remove(
          wishlistProducts.where((product) => productId == product.id).first,
        );
      } else {
        wishlist.add(productId);
        final query = FirebaseFirestore.instance
            .collection('Products')
            .where(FieldPath.documentId, isEqualTo: productId);
        wishlistProducts.addAll(
            await ProductRepository.instance.fetchProductsByQuery(query));
      }
      await _localStorage.saveData('WishlistProductIds', wishlist);
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
