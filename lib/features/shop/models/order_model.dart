import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/features/personalization/models/address_model.dart';
import 'package:t_store/localization/tr_constants.dart';

import '../../../utils/constants/enums.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'cart_item_model.dart';

class OrderModel {
  final String id;
  final String userId;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final AddressModel? address;
  final DateTime? deliveryDate;
  final List<CartItemModel> items;

  OrderModel({
    required this.id,
    required this.status,
    required this.items,
    required this.totalAmount,
    required this.orderDate,
    this.deliveryDate,
    this.userId = '',
    this.paymentMethod = 'Paypal',
    this.address,
  });

  String get formattedOrderDate => THelperFunctions.getFormattedDate(orderDate);

  String get formattedDeliveryDate => deliveryDate != null ? THelperFunctions.getFormattedDate(deliveryDate!) : '';

  String get orderStatusText => status == OrderStatus.delivered
      ? delivered.tr
      : status == OrderStatus.shipped
          ? shipmentOnTheWay.tr
          : processingOrder.tr;

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'status': status.toString(),
        'totalAmount': totalAmount,
        'orderDate': orderDate,
        'paymentMethod': paymentMethod,
        'address': address?.toJson(),
        'deliveryDate': deliveryDate,
        'items': items.map((item) => item.toJson()).toList(),
      };

  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return OrderModel(
      id: data['id'] as String,
      userId: data['userId'] as String,
      status: OrderStatus.values.firstWhere((element) => element.toString() == data['status']),
      totalAmount: data['totalAmount'] as double,
      orderDate: (data['orderDate'] as Timestamp).toDate(),
      paymentMethod: data['paymentMethod'] as String,
      address: AddressModel.fromMap(data['address'] as Map<String, dynamic>),
      deliveryDate: data['deliveryDate'] == null ? null : (data['deliveryDate'] as Timestamp).toDate(),
      items: (data['items'] as List<dynamic>).map((e) => CartItemModel.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}
