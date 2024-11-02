import 'package:flutter/material.dart';

class CGridLayout extends StatelessWidget {
  const CGridLayout(
      {super.key,
      required this.itemCount,
      this.mainAxisExtent = 140,
      this.crossAxisSpacing = 0,
      this.mainAxisSpacing = 0,
      required this.itemBuilder,
      this.crossAxisCount = 2});
  final int itemCount, crossAxisCount;
  final double? mainAxisExtent;
  final double crossAxisSpacing, mainAxisSpacing;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisExtent: mainAxisExtent,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
