import 'dart:convert';

import 'package:get/get.dart';
import 'package:t_store/data/repository/products/product_repository.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/utils/local_storage/storage_utility.dart';
import 'package:t_store/utils/popups/loaders.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();

  final favourites = <String, bool>{}.obs;
  final localStorage = TLocalStorage.instance();

  @override
  void onInit() {
    initFavourites();
    super.onInit();
  }

  void initFavourites() {
    final json = localStorage.readData('favourites');
    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId) {
    return favourites[productId] ?? false;
  }

  void toggleFavouriteProduct(String productId) {
    if (favourites.containsKey(productId)) {
      localStorage.removeData(productId);
      favourites.remove(productId);
      saveFavouritesToStorage();
      favourites.refresh();
      TLoaders.customToast(message: removeFromFavourites.tr);
    } else {
      favourites[productId] = true;
      saveFavouritesToStorage();
      TLoaders.customToast(message: addToFavourites.tr);
    }
  }

  void saveFavouritesToStorage() {
    final encodedFavourites = json.encode(favourites);
    localStorage.writeData('favourites', encodedFavourites);
  }

  Future<List<ProductModel>> favouriteProducts() async {
    return await ProductRepository.instance.getFavouriteProducts(favourites.keys.toList());
  }
}
