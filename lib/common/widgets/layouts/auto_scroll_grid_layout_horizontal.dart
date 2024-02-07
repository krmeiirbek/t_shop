import 'dart:async';

import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AutoScrollGridViewHorizontal extends StatefulWidget {
  final int itemCount;
  final double mainAxisExtent;
  final IndexedWidgetBuilder itemBuilder;

  const AutoScrollGridViewHorizontal({
    Key? key,
    required this.itemCount,
    this.mainAxisExtent = 288,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  AutoScrollGridViewState createState() => AutoScrollGridViewState();
}

class AutoScrollGridViewState extends State<AutoScrollGridViewHorizontal> {
  late final ScrollController _scrollController;
  late final Timer _timer;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      _scrollOffset += widget.mainAxisExtent + TSizes.gridViewSpacing;
      if (_scrollOffset >= _scrollController.position.maxScrollExtent) {
        _scrollOffset = 0.0;
      }
      _scrollController.animateTo(
        _scrollOffset,
        duration: const Duration(seconds: 1),
        curve: Curves.ease,
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: TSizes.gridViewSpacing,
        crossAxisSpacing: TSizes.gridViewSpacing,
        mainAxisExtent: widget.mainAxisExtent,
      ),
      controller: _scrollController,
      itemBuilder: widget.itemBuilder,
    );
  }
}
