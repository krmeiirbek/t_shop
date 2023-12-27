import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String imageURL;
  final String targetScreen;
  final bool active;

  BannerModel({
    required this.imageURL,
    required this.active,
    required this.targetScreen,
  });

  Map<String, dynamic> toJson() => {
        'ImageURL': imageURL,
        'Active': active,
        'TargetScreen': targetScreen,
      };

  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BannerModel(
      imageURL: data['ImageURL'] ?? '',
      active: data['Active'] ?? false,
      targetScreen: data['TargetScreen'] ?? '',
    );
  }
}
