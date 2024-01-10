import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

import 'circular_container.dart';

class TAppBarContainer extends StatelessWidget {
  const TAppBarContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: TColors.primary,
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          Positioned(
            top: -300,
            right: 0,
            child: TCircularContainer(
              backgroundColor: TColors.textWhite.withOpacity(0.1),
            ),
          ),
          Positioned(
            top: -300,
            right: -250,
            child: TCircularContainer(
              backgroundColor: TColors.textWhite.withOpacity(0.1),
            ),
          ),
          Positioned(
            top: -300,
            right: 250,
            child: TCircularContainer(
              backgroundColor: TColors.textWhite.withOpacity(0.1),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
