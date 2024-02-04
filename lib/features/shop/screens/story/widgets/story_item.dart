import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({super.key, required this.backgroundColor, required this.image});

  final Color backgroundColor;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
