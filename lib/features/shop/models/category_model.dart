import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String nameRU;
  String nameKZ;
  String image;
  String parentId;
  List<CategoryModel>? subCategories;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.nameRU,
    required this.nameKZ,
    required this.image,
    required this.isFeatured,
    this.subCategories,
    this.parentId = '',
  });

  static CategoryModel empty() => CategoryModel(
        id: '',
        nameRU: '',
        nameKZ: '',
        image: '',
        isFeatured: false,
      );

  CategoryModel copyWith({
    String? id,
    String? nameRU,
    String? nameKZ,
    String? image,
    String? parentId,
    List<CategoryModel>? subCategories,
    bool? isFeatured,
  }) =>
      CategoryModel(
        id: id ?? this.id,
        nameRU: nameRU ?? this.nameRU,
        nameKZ: nameKZ ?? this.nameKZ,
        image: image ?? this.image,
        subCategories: subCategories ?? this.subCategories,
        isFeatured: isFeatured ?? this.isFeatured,
      );

  Map<String, dynamic> toJson() => {
        'Name_RU': nameRU,
        'Name_KZ': nameKZ,
        'Image': image,
        'IsFeatured': isFeatured,
        'ParentId': parentId,
      };

  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return CategoryModel(
        id: document.id,
        nameKZ: data['Name_KZ'] ?? '',
        nameRU: data['Name_RU'] ?? '',
        image: data['Image'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        parentId: data['ParentId'] ?? '',
      );
    } else {
      return CategoryModel.empty();
    }
  }
}
