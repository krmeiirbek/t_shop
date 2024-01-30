class ProductPerformanceModel {
  String? name;
  final String? value;

  ProductPerformanceModel({this.name, this.value});

  toJson() => {'Name': name, 'Value': value};

  factory ProductPerformanceModel.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return ProductPerformanceModel();
    return ProductPerformanceModel(
      name: json['Name'] ?? '',
      value: json['Value'] ?? '',
    );
  }
}
