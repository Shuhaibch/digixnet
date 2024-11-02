import 'package:digixnet/core/utils/color/colors.dart';
import 'package:flutter/material.dart';

class CCustomTextFormFeild extends StatelessWidget {
  const CCustomTextFormFeild({
    this.obscureText = false,
    super.key,
    this.keyboardType,
    this.onTap,
    this.icon,
    this.suffixIcon,
    this.maxLine = 1,
    this.filled = true,
    this.isReadOnly = false,
    required this.controller,
    this.hintText,
    this.borderColor = CColors.whiteColor,
    this.backgroundColor = CColors.whiteColor,
  });
  final IconData? icon;
  final TextEditingController controller;
  final String? hintText;
  final bool filled, obscureText, isReadOnly;
  final Color borderColor;
  final Color? backgroundColor;
  final Widget? suffixIcon;
  final int? maxLine;
  final TextInputType? keyboardType;

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      controller: controller,
      readOnly: isReadOnly,
      onTap: onTap,
      cursorColor: CColors.blackColor,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          fillColor: backgroundColor,
          filled: filled,
          hintStyle: const TextStyle(color: CColors.darkGreyColor),
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: Icon(
            icon,
            color: CColors.blackColor,
          ),
          enabledBorder: Theme.of(context)
              .inputDecorationTheme
              .enabledBorder!
              .copyWith(borderSide: BorderSide(color: borderColor)),
          focusedBorder: Theme.of(context)
              .inputDecorationTheme
              .focusedBorder!
              .copyWith(borderSide: BorderSide(color: borderColor)),
          border: Theme.of(context)
              .inputDecorationTheme
              .border!
              .copyWith(borderSide: BorderSide(color: borderColor))),
    );
  }
}
