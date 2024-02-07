import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/success_screen/success_screen.dart';
import 'package:t_store/data/repository/authentication/authentication_repository.dart';
import 'package:t_store/data/repository/order/order_repository.dart';
import 'package:t_store/features/personalization/controllers/address_controller.dart';
import 'package:t_store/features/shop/controllers/product/cart_controller.dart';
import 'package:t_store/features/shop/controllers/product/checkout_controller.dart';
import 'package:t_store/features/shop/models/order_model.dart';
import 'package:t_store/localization/tr_constants.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = OrderRepository.instance;
  final authRepository = AuthenticationRepository.instance;

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      return await orderRepository.fetchUserOrders();
    } catch (e) {
      TLoaders.warningSnackBar(title: ohSnapText.tr, message: e.toString());
      return [];
    }
  }

  void processOrder(double totalAmount) async {
    try {
      TFullScreenLoader.openLoadingDialog(processingOrder.tr, TImages.loading);
      final userId = authRepository.authUser!.uid;
      if (userId.isEmpty) return;
      final order = OrderModel(
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.processing,
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
      );

      await orderRepository.saveOrder(order, userId);
      final text = """
🛒: ${order.id}
🔐: $userId
📍: ${order.address.toString()}
🕒: ${order.formattedOrderDate}
📦:\n ${order.items.map((e) => '\n${nameText.tr}: ${e.title} ${zhetPrice.tr}: ${e.price}₸ x ${e.quantity} = ${e.price * e.quantity}₸\n')}
💰: ${order.totalAmount}₸
💳: ${order.paymentMethod}
${whenSendCheck.tr}
""";
      final link = WhatsAppUnilink(
        phoneNumber: sendCheckPhoneNumber.tr,
        text: text,
      );
      await launchUrl(link.asUri());
      cartController.clearCart();
      Get.to(
        () => SuccessScreen(
          image: TImages.successfulPaymentIcon,
          title: successPayment.tr,
          subtitle: successPaymentMessage.tr,
          onPressed: () => Get.offAll(() => const NavigationMenu()),
        ),
      );
    } catch (e) {
      throw e.toString();
    }
  }
}
