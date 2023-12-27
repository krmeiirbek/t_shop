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
      productsCount: json['ProductsCount'] ?? 0,
      isFeatured: json['IsFeatured'] ?? false,
    );
  }
}
