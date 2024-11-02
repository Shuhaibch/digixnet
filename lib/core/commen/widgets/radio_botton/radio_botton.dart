import 'package:digixnet/core/utils/color/colors.dart';
import 'package:flutter/material.dart';

class RadioButtonWidget extends StatelessWidget {
  const RadioButtonWidget({
    super.key,
    required this.value,
    this.onChanged,
    this.groupValue,
    this.title,
    this.textColor = CColors.blackColor,
    this.iconColor = CColors.greyColor,
  });

  final String? value, groupValue, title;
  final Color textColor, iconColor;

  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: value!,
          splashRadius: 10,
          groupValue: groupValue,
          onChanged: onChanged,
          visualDensity: VisualDensity.comfortable,
          // visualDensity: VisualDensity.compact,
          // fillColor: WidgetStatePropertyAll(iconColor),
          activeColor: CColors.secondaryColor,
          focusColor: CColors.secondaryColor,
          overlayColor: const WidgetStatePropertyAll(CColors.secondaryColor),
        ),
        Text(title!,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: CColors.blackColor))
      ],
    );
  }
}
