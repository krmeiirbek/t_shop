import 'package:cloud_firestore/cloud_firestore.dart';

class ProductReviewModel {
  final String id;
  final String? userId;
  final double rating;
  final String? comment;
  final String? userName;
  final DateTime timestamp;
  final String? userImageUrl;
  final String? companyComment;
  final DateTime? companyTimestamp;

  ProductReviewModel({
    required this.id,
    required this.userId,
    required this.rating,
    required this.timestamp,
    this.comment,
    this.userName,
    this.userImageUrl,
    this.companyComment,
    this.companyTimestamp,
  });

  static ProductReviewModel empty() => ProductReviewModel(id: '', userId: '', rating: 5, timestamp: DateTime.now());

  factory ProductReviewModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductReviewModel.empty();
    final data = document.data()!;
    return ProductReviewModel(
      id: document.id,
      userId: data['userId'],
      rating: data['rating'].toDouble(),
      timestamp: (data['timestamp'] as Timestamp).toDate(),
      comment: data['comment'],
      userName: data['userName'],
      userImageUrl: data['userImageUrl'],
      companyComment: data['companyComment'],
      companyTimestamp: data['companyTimestamp'] != null ? (data['companyTimestamp'] as Timestamp).toDate() : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'rating': rating,
      'timestamp': timestamp.toIso8601String(),
      'comment': comment,
      'userName': userName,
      'userImageUrl': userImageUrl,
      'companyComment': companyComment,
      'companyTimestamp': companyTimestamp?.toIso8601String(),
    };
  }
}
