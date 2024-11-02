import 'package:digixnet/core/utils/color/colors.dart';
import 'package:flutter/material.dart';

class CTextFeildTheme {
  CTextFeildTheme._();

  //? light TextForm Feild
  static InputDecorationTheme lightInputDecarationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,

    // constraints:  BoxConstraints.expand(height: 14 ,),
    labelStyle:
        const TextStyle().copyWith(fontSize: 14, color: CColors.primaryColor),
    hintStyle:
        const TextStyle().copyWith(fontSize: 14, color: CColors.primaryColor),
    errorStyle: const TextStyle().copyWith(
      fontStyle: FontStyle.normal,
    ),
    floatingLabelStyle:
        const TextStyle().copyWith(color: Colors.black.withOpacity(.8)),
    border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          width: 2,
          color: CColors.primaryColor,
        )),
    enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(width: 2, color: CColors.primaryColor)),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 2, color: CColors.primaryColor),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(
        8,
      ),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        width: 2,
        color: Colors.orange,
      ),
    ),
  );
}
