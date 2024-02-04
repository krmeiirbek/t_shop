import 'package:cloud_firestore/cloud_firestore.dart';

enum StoryType { image, video, gif }

class StoryModel {
  final String mediaUrl;
  final String title;
  final String productLink;
  final DateTime createdAt;
  final StoryType type;
  final bool userSee;

  StoryModel({
    required this.mediaUrl,
    required this.title,
    required this.productLink,
    required this.createdAt,
    required this.type,
    this.userSee = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'mediaUrl': mediaUrl,
      'title': title,
      'productLink': productLink,
      'createdAt': createdAt.toUtc().toIso8601String(),
      'type': type.toString().split('.').last,
    };
  }

  factory StoryModel.fromJson(Map<String, dynamic> snapshot) {
    return StoryModel(
      mediaUrl: snapshot['mediaUrl'],
      title: snapshot['title'],
      productLink: snapshot['productLink'],
      createdAt: (snapshot['createdAt'] as Timestamp).toDate(),
      type: _parseStoryType(snapshot['type']),
    );
  }

  static StoryType _parseStoryType(String type) {
    switch (type) {
      case 'image':
        return StoryType.image;
      case 'video':
        return StoryType.video;
      case 'gif':
        return StoryType.gif;
      default:
        throw ArgumentError('Invalid story type: $type');
    }
  }
}
