import 'package:digixnet/core/utils/color/colors.dart';
import 'package:flutter/material.dart';

class CTextTheme {
  CTextTheme._();
  //?-------- Light Theme --------------
  static TextTheme lightTextTheme = TextTheme(
    //* headline
    headlineLarge: const TextStyle().copyWith(
        fontSize: 30, fontWeight: FontWeight.bold, color: CColors.blackColor),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 24, fontWeight: FontWeight.w600, color: CColors.blackColor),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 21, fontWeight: FontWeight.w600, color: CColors.blackColor),

    //* displayc
    displayLarge: const TextStyle().copyWith(
        fontSize: 24, fontWeight: FontWeight.bold, color: CColors.blackColor),
    displayMedium: const TextStyle().copyWith(
        fontSize: 22, fontWeight: FontWeight.w600, color: CColors.blackColor),
    displaySmall: const TextStyle().copyWith(
        fontSize: 20, fontWeight: FontWeight.w600, color: CColors.blackColor),

    //* title
    titleLarge: const TextStyle().copyWith(
        fontSize: 17, fontWeight: FontWeight.w600, color: CColors.blackColor),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16, fontWeight: FontWeight.w500, color: CColors.blackColor),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16, fontWeight: FontWeight.w400, color: CColors.blackColor),

    //* body
    bodyLarge: const TextStyle().copyWith(
        fontSize: 14, fontWeight: FontWeight.w500, color: CColors.blackColor),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14, fontWeight: FontWeight.normal, color: CColors.blackColor),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: CColors.blackColor.withOpacity(0.5)),

    //* label
    labelLarge: const TextStyle().copyWith(
        fontSize: 12, fontWeight: FontWeight.normal, color: CColors.blackColor),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.black.withOpacity(0.5)),
    labelSmall: const TextStyle().copyWith(
        fontSize: 10,
        fontWeight: FontWeight.normal,
        color: Colors.black.withOpacity(0.5)),
  );
}
