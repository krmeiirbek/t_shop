import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class StoryProgressBar extends StatelessWidget {
  const StoryProgressBar({super.key, required this.percentWatched});

  final double percentWatched;

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight: 8,
      percent: percentWatched,
      progressColor: Colors.grey[400],
      backgroundColor: Colors.grey[600],
      barRadius: const Radius.circular(10),
    );
  }
}
