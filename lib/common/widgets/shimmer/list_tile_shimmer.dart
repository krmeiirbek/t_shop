import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/shimmer/shimmer.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TListTileShimmer extends StatelessWidget {
  const TListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const TShimmerEffect(width: 50, height: 50, radius: 50),
            SizedBox(width: TSizes.spaceBtwItems),
            Column(
              children: [
                const TShimmerEffect(width: 100, height: 15),
                SizedBox(width: TSizes.spaceBtwItems / 2),
                const TShimmerEffect(width: 80, height: 12),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
