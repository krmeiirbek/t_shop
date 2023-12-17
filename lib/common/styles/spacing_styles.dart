import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TSpacingStyle {
  static final EdgeInsetsGeometry paddingWithAppbarHeight = EdgeInsets.only(
    top: TSizes.appBarHeight,
    bottom: TSizes.defaultSpace,
    left: TSizes.defaultSpace,
    right: TSizes.defaultSpace,
  );
}
