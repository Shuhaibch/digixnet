import 'package:flutter/material.dart';

class CBottomSheetTheme {
  CBottomSheetTheme._();

  //? Light Bottom Sheet Theme
  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Colors.white,
    modalBackgroundColor: Colors.white,
    constraints: const BoxConstraints(
      minWidth: double.infinity,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        16,
      ),
    ),
  );

}