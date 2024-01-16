import 'package:get/get.dart';
import 'package:t_store/data/repository/user/user_repository.dart';
import 'package:t_store/features/shop/controllers/product/variation_controller.dart';
import 'package:t_store/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(UserRepository());
    Get.put(VariationController());
  }
}
