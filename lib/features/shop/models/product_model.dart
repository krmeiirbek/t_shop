import 'package:cloud_firestore/cloud_firestore.dart';

import 'brand_model.dart';
import 'product_attribute_model.dart';
import 'product_performance_model.dart';
import 'product_variation_model.dart';

class ProductModel {
  String id;
  String? companyId;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  String productType;
  List<String>? images;
  List<ProductPerformanceModel>? productPerformances;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.companyId,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.brand,
    this.date,
    this.images,
    this.salePrice = 0.0,
    this.isFeatured,
    this.categoryId,
    this.description,
    this.productPerformances,
    this.productAttributes,
    this.productVariations,
  });

  /// Create Empty func for clean code
  static ProductModel empty() => ProductModel(id: '', title: '', stock: 0, price: 0, thumbnail: '', productType: '', companyId: '');

  toJson() => {
    'Title': title,
    'CompanyId': companyId,
    'Stock': stock,
    'Price': price,
    'Thumbnail': thumbnail,
    'Sku': sku,
    'Brand': brand?.toJson(),
    'Images': images ?? [],
    'SalePrice': salePrice,
    'IsFeatured': isFeatured,
    'CategoryId': categoryId,
    'ProductType': productType,
    'Description': description,
    'ProductPerformances': productPerformances?.map((e) => e.toJson()).toList() ?? [],
    'ProductAttributes': productAttributes?.map((e) => e.toJson()).toList() ?? [],
    'ProductVariations': productVariations?.map((e) => e.toJson()).toList() ?? [],
  };

  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      title: data['Title'],
      companyId: data['CompanyId'],
      stock: data['Stock'] ?? 0,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      sku: data['SKU'],
      brand: data['Brand'] == null ? null : BrandModel.fromJson(data['Brand']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      isFeatured: data['IsFeatured'] ?? false,
      categoryId: data['CategoryId'] ?? '',
      productType: data['ProductType'] ?? '',
      description: data['Description'] ?? '',
      productPerformances: data['ProductPerformances'] == null ? null : (data['ProductPerformances'] as List<dynamic>).map((e) => ProductPerformanceModel.fromJson(e)).toList(),
      productAttributes: data['ProductAttributes'] == null ? null : (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
      productVariations: data['ProductVariations'] == null ? null : (data['ProductVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
    );
  }

  factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      id: document.id,
      sku: data['SKU'] ?? '',
      companyId: data['CompanyId'] ?? '',
      title: data['Title'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      thumbnail: data['Thumbnail'] ?? '',
      stock: data['Stock'] ?? 0,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      brand: data['Brand'] == null ? null : BrandModel.fromJson(data['Brand']),
      productPerformances: data['ProductPerformances'] == null ? null : (data['ProductPerformances'] as List<dynamic>).map((e) => ProductPerformanceModel.fromJson(e)).toList(),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: data['ProductAttributes'] == null ? null : (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
      productVariations: data['ProductVariations'] == null ? null : (data['ProductVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
    );
  }
}
