class ProductPerformanceModel {
  String? name;
  final String? value;

  ProductPerformanceModel({this.name, this.value});

  toJson() => {'Name': name, 'Value': value};

  /// Map Json oriented document snapshot from Firebase to Model
  factory ProductPerformanceModel.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return ProductPerformanceModel();
    return ProductPerformanceModel(
      name: json['Name'] ?? '',
      value: json['Value'] ?? '',
    );
  }
}
