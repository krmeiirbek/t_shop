class ProductAttributeModel {
  String? name;
  final List<String>? values;

  ProductAttributeModel({this.name, this.values});

  toJson() => {
        'Name': name,
        'Values': values,
      };

  factory ProductAttributeModel.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return ProductAttributeModel();
    return ProductAttributeModel(
      name: json['Name'] ?? '',
      values: List<String>.from(json['Values']),
    );
  }
}
