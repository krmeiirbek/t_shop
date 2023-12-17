import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

import 'circular_container.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: TColors.primary,
      padding: EdgeInsets.zero,
      child: SizedBox(
        height: 400,
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: TCircularContainer(
                backgroundColor: TColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: TCircularContainer(
                backgroundColor: TColors.textWhite.withOpacity(0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
