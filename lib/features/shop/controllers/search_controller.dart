import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/custom_search_delegate.dart';

class ZhetSearchController extends GetxController {
  static ZhetSearchController get instance => Get.find();
  final productName = ''.obs;

  void onChanged(String value) {
    productName.value = value;
  }

  void openSearchBar(BuildContext context) {
    showSearch(
      context: context,
      delegate: CustomSearchDelegate(),
    );
  }
}
