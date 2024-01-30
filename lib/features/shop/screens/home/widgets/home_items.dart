import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/controllers/home_controller.dart';

class HomeItems extends GetView<HomeController> {
  const HomeItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.loading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          children: controller.homeItems,
        );
      },
    );
  }
}
