import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/localization/tr_constants.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle,
    this.onPressed,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title;
  final String? buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.apply(color: textColor),
        ),
        if (showActionButton) TextButton(onPressed: onPressed, child: Text(buttonTitle ?? seeAllText.tr)),
      ],
    );
  }
}
