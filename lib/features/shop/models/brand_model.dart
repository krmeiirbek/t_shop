import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({
    required this.id,
    required this.image,
    required this.name,
    this.isFeatured,
    this.productsCount,
  });

  static BrandModel empty() => BrandModel(id: '', image: '', name: '');

  toJson() => {
        'Id': id,
        'Name': name,
        'Image': image,
        'ProductsCount': productsCount,
        'IsFeatured': isFeatured,
      };

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: json['Id'] ?? '',
      name: json['Name'] ?? '',
      image: json['Image'] ?? '',
      isFeatured: json['IsFeatured'] ?? false,
      productsCount: int.parse((json['ProductsCount'] ?? 0).toString()),
    );
  }

  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return BrandModel.empty();
    final data = document.data()!;
    return BrandModel(
      id: document.id,
      name: data['Name'] ?? '',
      image: data['Image'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      productsCount: int.parse((data['ProductsCount'] ?? 0).toString()),
    );
  }
}
