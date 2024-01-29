class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });

  toJson() => {
        'Id': id,
        'SKU': sku,
        'Image': image,
        'Description': description,
        'Price': price,
        'SalePrice': salePrice,
        'Stock': stock,
        'AttributeValues': attributeValues,
      };

  /// Create Empty func for clean code
  static ProductVariationModel empty() => ProductVariationModel(id: '', attributeValues: {});

  /// Map Json oriented document snapshot from Firebase to Model
  factory ProductVariationModel.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
      id: json['Id'] ?? '',
      price: double.parse((json['Price'] ?? 0.0).toString()),
      sku: json['SKU'] ?? '',
      stock: json['Stock'] ?? 0,
      salePrice: double.parse((json['SalePrice'] ?? 0.0).toString()),
      image: json['Image'] ?? '',
      description: json['Description'] ?? '',
      attributeValues: Map<String, String>.from(json['AttributeValues']),
    );
  }
}
