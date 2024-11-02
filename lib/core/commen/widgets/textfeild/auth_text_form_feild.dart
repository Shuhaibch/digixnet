import 'package:digixnet/core/utils/color/colors.dart';
import 'package:flutter/material.dart';

class AuthTextFormFeild extends StatelessWidget {
  const AuthTextFormFeild({
    this.obscureText = false,
    super.key,
    this.onTap,
    this.icon,
    this.suffixIcon,
    required this.controller,
    required this.hintText,
  });
  final IconData? icon, suffixIcon;
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: CColors.primaryColor,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(
          icon,
          color: CColors.primaryColor,
        ),
        suffixIcon: InkWell(
          onTap: onTap,
          child: Icon(
            suffixIcon,
            color: CColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
