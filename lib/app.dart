import 'package:digixnet/core/utils/color/colors.dart';
import 'package:digixnet/core/utils/theme/theme.dart';
import 'package:digixnet/features/splash/screen/splash_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: CColors.whiteColor,
      debugShowCheckedModeBanner: false,
      title: 'digixnet App',
      themeMode: ThemeMode.system,
      theme: CAppTheme.lightTheme,
      home: const SafeArea(
        child: SplashScreen(),
      ),
    );
  }
}
