import 'package:get/get.dart';
import 'package:t_store/data/repository/address/address_repository.dart';
import 'package:t_store/data/repository/banners/banner_repository.dart';
import 'package:t_store/data/repository/brands/brand_repository.dart';
import 'package:t_store/data/repository/categories/category_repository.dart';
import 'package:t_store/data/repository/home/home_repository.dart';
import 'package:t_store/data/repository/order/order_repository.dart';
import 'package:t_store/data/repository/products/product_repository.dart';
import 'package:t_store/data/repository/story/story_repository.dart';
import 'package:t_store/data/repository/user/user_repository.dart';
import 'package:t_store/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(AddressRepository());
    Get.put(BannerRepository());
    Get.put(BrandRepository());
    Get.put(CategoryRepository());
    Get.put(HomeRepository());
    Get.put(OrderRepository());
    Get.put(ProductRepository());
    Get.put(StoryRepository());
    Get.put(UserRepository());
  }
}
