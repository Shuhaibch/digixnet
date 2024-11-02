import 'package:digixnet/core/utils/color/colors.dart';
import 'package:flutter/material.dart';

class COutLinedButtonTheme {
  COutLinedButtonTheme._();

  //? Light OutlinedButton theme
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    elevation: 0,
    foregroundColor: CColors.secondaryColor,
    
    side: const BorderSide(color: CColors.secondaryColor, width: 2),
    textStyle: const TextStyle(
      fontSize: 16,
      color: CColors.secondaryColor,
      fontWeight: FontWeight.w600,
    ),
    padding: const EdgeInsets.symmetric(
      vertical: 16,
      horizontal: 20,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
  ));
}
