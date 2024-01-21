import 'package:cloud_firestore/cloud_firestore.dart';

class HomeItemModel {
  final List<Map<String, dynamic>> pageItems;

  HomeItemModel({required this.pageItems});

  Map<String, dynamic> toJson() => {
        'pageItems': pageItems,
      };

  factory HomeItemModel.fromSnapshot(DocumentSnapshot document) {
    final data = document.data() as Map<String, dynamic>;

    return HomeItemModel(
      pageItems: List<Map<String, dynamic>>.from(data['pageItems'] ?? []),
    );
  }
}
