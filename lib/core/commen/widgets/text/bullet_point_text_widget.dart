import 'package:digixnet/core/utils/color/colors.dart';
import 'package:flutter/material.dart';

class BulletPointTextWidget extends StatelessWidget {
  const BulletPointTextWidget({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      '\u2022 $text',
      style: Theme.of(context)
          .textTheme
          .labelLarge!
          .copyWith(color: CColors.blackColor, overflow: TextOverflow.ellipsis),
    );
  }
}
