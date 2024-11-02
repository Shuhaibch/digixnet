import 'package:digixnet/core/utils/color/colors.dart';
import 'package:digixnet/core/utils/sizes/sizes.dart';
import 'package:flutter/material.dart';

class ServiceDetailsTextRowWidget extends StatelessWidget {
  const ServiceDetailsTextRowWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.textColor = CColors.blackColor,
    this.isNote = false,
    required this.icon,
  });
  final String title, subtitle;
  final IconData icon;
  final Color textColor;
  final bool isNote;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 4,
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(width: CSizes.sm),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 19),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 3,
          child: Text(
            subtitle,
            maxLines: isNote ? null : 1,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: textColor),
          ),
        ),
      ],
    );
  }
}
