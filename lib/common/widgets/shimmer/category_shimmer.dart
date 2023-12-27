import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/shimmer/shimmer.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({
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
            const TShimmerEffect(width: 55, height: 55, radius: 55),
            SizedBox(width: TSizes.spaceBtwItems / 2),
            const TShimmerEffect(width: 55, height: 8),
          ],
        ),
        separatorBuilder: (_, __) => SizedBox(width: TSizes.spaceBtwItems),
        itemCount: itemCount,
      ),
    );
  }
}
