import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String nameRU;
  String nameKZ;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.nameRU,
    required this.nameKZ,
    required this.image,
    required this.isFeatured,
    this.parentId = '',
  });

  static CategoryModel empty() => CategoryModel(
        id: '',
        nameRU: '',
        nameKZ: '',
        image: '',
        isFeatured: false,
      );

  Map<String, dynamic> toJson() => {
        'Name_RU': nameRU,
        'Name_KZ': nameKZ,
        'Image': image,
        'IsFeatured': isFeatured,
        'ParentId': parentId,
      };

  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
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
