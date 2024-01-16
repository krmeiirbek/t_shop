class CartItemModel {
  String title;
  double price;
  String? image;
  int quantity;
  String productId;
  String variationId;
  String? brandName;
  Map<String, String>? selectedVariation;

  CartItemModel({
    required this.quantity,
    required this.productId,
    this.variationId = '',
    this.image,
    this.price = 0.0,
    this.title = '',
    this.brandName,
    this.selectedVariation,
  });

  static CartItemModel empty() => CartItemModel(productId: '', quantity: 0);

  Map<String, dynamic> toJson() => {
        'title': title,
        'price': price,
        'image': image,
        'quantity': quantity,
        'productId': productId,
        'variationId': variationId,
        'brandName': brandName,
        'selectedVariation': selectedVariation,
      };

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        title: json['title'],
        price: json['price']?.toDouble(),
        image: json['image'],
        quantity: json['quantity'],
        productId: json['productId'],
        variationId: json['variationId'],
        brandName: json['brandName'],
        selectedVariation: json['selectedVariation'] != null ? Map<String, String>.from(json['selectedVariation']) : null,
      );
}
