import 'package:digixnet/core/utils/theme/custom_theme/app_bar_theme.dart';
import 'package:digixnet/core/utils/theme/custom_theme/bottom_sheet_theme.dart';
import 'package:digixnet/core/utils/theme/custom_theme/check_box_theme.dart';
import 'package:digixnet/core/utils/theme/custom_theme/chip_theme.dart';
import 'package:digixnet/core/utils/theme/custom_theme/elevated_botton_theme.dart';
import 'package:digixnet/core/utils/theme/custom_theme/out_lined_button_theme.dart';
import 'package:digixnet/core/utils/theme/custom_theme/text_feild_theme.dart';
import 'package:digixnet/core/utils/theme/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';
class CAppTheme {
  CAppTheme._();

  //? light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    textTheme: CTextTheme.lightTextTheme,
    elevatedButtonTheme: CElevatedButtonTheme.lightElevatedButtonTheme,
    chipTheme: CChipTheme.lightChipTheme,
    appBarTheme: CAppBarTheme.lightAppBarTheme,
    checkboxTheme: CCheckBoxTheme.lightCheckBoxTheme,
    bottomSheetTheme: CBottomSheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: COutLinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: CTextFeildTheme.lightInputDecarationTheme,
  );

}
