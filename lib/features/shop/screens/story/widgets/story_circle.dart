import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/utils/constants/colors.dart';

class StoryCircle extends StatelessWidget {
  const StoryCircle({
    super.key,
    required this.onTap,
    required this.image,
    required this.title,
  });

  final VoidCallback onTap;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TCircularImage(
              image: image,
              isNetworkImage: true,
              borderLight: true,
              height: 80,
              width: 80,
              padding: 0,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 3),
            Text(
              title,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: TColors.black),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
