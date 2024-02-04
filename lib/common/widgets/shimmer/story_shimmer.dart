import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/shimmer/shimmer.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TStoryShimmer extends StatelessWidget {
  const TStoryShimmer({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, __) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TShimmerEffect(width: 70, height: 70, radius: 70),
            SizedBox(width: TSizes.spaceBtwItems / 2),
            const TShimmerEffect(width: 70, height: 8),
          ],
        ),
        separatorBuilder: (_, __) => SizedBox(width: TSizes.spaceBtwItems),
        itemCount: itemCount,
      ),
    );
  }
}
