import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../utils/app_colors.dart';



class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  final _appBarTheme = const AppBarTheme(
      backgroundColor: AppColors.materialThemeSysLightSecondary);

  final _floatingActionButtonTheme = const FloatingActionButtonThemeData(
      backgroundColor: AppColors.materialThemeSysLightPrimaryContainer);

  ThemeData buildLightTheme() {
    return ThemeData(
        brightness: Brightness.light,
        appBarTheme: _appBarTheme,
        useMaterial3: true,
        floatingActionButtonTheme: _floatingActionButtonTheme,
        colorScheme: _lightColorScheme,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: AppColors.materialThemeReadOnlyLightWhite,
        primaryColor: AppColors.materialThemeSysLightPrimary,
        textTheme: _customTextTheme);
  }

  ThemeData buildDarkTheme() {
    return ThemeData(
        appBarTheme: _appBarTheme,
        useMaterial3: true,
        floatingActionButtonTheme: _floatingActionButtonTheme,
        scaffoldBackgroundColor: AppColors.materialThemeReadOnlyLightWhite,
        brightness: Brightness.dark,
        colorScheme: _darkColorScheme,
        fontFamily: 'Roboto',
        primaryColor: AppColors.materialThemeSysDarkPrimary,
        textTheme: _customTextTheme);
  }
}

final TextTheme _customTextTheme = Typography().englishLike.copyWith(
      headlineLarge: const TextStyles().materialThemeHeadLineLarge,
      headlineMedium: const TextStyles().materialThemeHeadLineMedium,
      headlineSmall: const TextStyles().materialThemeHeadLineSmall,
      displayLarge: const TextStyles().materialThemedIsPlayLarge,
      displayMedium: const TextStyles().materialThemedIsPlayMedium,
      displaySmall: const TextStyles().materialThemedIsPlaySmall,
      titleLarge: const TextStyles().materialThemeTitleLarge,
      titleMedium: const TextStyles().materialThemeTitleMedium,
      titleSmall: const TextStyles().materialThemeTitleSmall,
      bodyLarge: const TextStyles().materialThemeBodyLarge,
      bodyMedium: const TextStyles().materialThemeBodyMedium,
      bodySmall: const TextStyles().materialThemeBodySmall,
      labelLarge: const TextStyles().materialThemeLabelLarge,
      labelMedium: const TextStyles().materialThemeLabelMedium,
      labelSmall: const TextStyles().materialThemeLabelSmall,
    );

const ColorScheme _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    background: AppColors.materialThemeSysLightBackground,
    error: AppColors.materialThemeSysLightError,
    inversePrimary: AppColors.materialThemeSysLightInversePrimary,
    onPrimary: AppColors.materialThemeSysLightOnPrimary,
    primaryContainer: AppColors.materialThemeSysLightPrimaryContainer,
    onPrimaryContainer: AppColors.materialThemeSysLightOnPrimaryContainer,
    onSecondary: AppColors.materialThemeSysLightOnSecondary,
    onSecondaryContainer: AppColors.materialThemeSysLightOnSecondaryContainer,
    onSurface: AppColors.materialThemeSysLightOutline,
    outline: AppColors.materialThemeSysLightOutline,
    onBackground: AppColors.materialThemeSysLightOnBackground,
    onError: AppColors.materialThemeSysLightOnError,
    primary: AppColors.materialThemeSysLightPrimary,
    tertiary: AppColors.materialThemeSysLightTertiary,
    secondary: AppColors.materialThemeSysLightSecondary,
    surface: AppColors.materialThemeSysLightSurface,
    surfaceTint: AppColors.materialThemeSysLightReadOnlySurface2,
    onTertiary: AppColors.materialThemeSysLightOnTertiary,
    onInverseSurface: AppColors.materialThemeReadOnlyLightBlack,
    onTertiaryContainer: AppColors.materialThemeSysLightOnTertiaryContainer);

const ColorScheme _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    background: AppColors.materialThemeSysDarkBackground,
    error: AppColors.materialThemeSysDarkError,
    inversePrimary: AppColors.materialThemeSysDarkInversePrimary,
    onPrimary: AppColors.materialThemeSysDarkOnPrimary,
    primaryContainer: AppColors.materialThemeSysDarkPrimaryContainer,
    onPrimaryContainer: AppColors.materialThemeSysDarkOnPrimaryContainer,
    onSecondary: AppColors.materialThemeSysDarkOnSecondary,
    onSecondaryContainer: AppColors.materialThemeSysDarkOnSeconDaryContainer,
    onSurface: AppColors.materialThemeSysDarkOnSurface,
    onBackground: AppColors.materialThemeSysDarkOnBackground,
    onError: AppColors.materialThemeSysDarkOnError,
    primary: AppColors.materialThemeSysDarkPrimary,
    tertiary: AppColors.materialThemeSysDarkTertiary,
    secondary: AppColors.materialThemeSysDarkSecondary,
    surface: AppColors.materialThemeSysDarkSurface,
    onTertiary: AppColors.materialThemeSysDarkOnTertiary,
    onInverseSurface: AppColors.materialThemeReadOnlyDarkBlack,
    surfaceTint: AppColors.materialThemeSysDarkReadOnlySurface2,
    onTertiaryContainer: AppColors.materialThemeSysDarkOnTertiaryContainer);

class TextStyles {
  const TextStyles();

  TextStyle get materialThemeDisplay1 => const TextStyle(
        fontSize: 64,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 76 / 64,
        letterSpacing: -0.5,
      );

  TextStyle get materialThemeDisplay2 => const TextStyle(
        fontSize: 57,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 64 / 57,
        letterSpacing: -0.25,
      );

  TextStyle get materialThemeDisplay3 => const TextStyle(
        fontSize: 45,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 52 / 45,
        letterSpacing: 0,
      );

  TextStyle get materialThemeHeadLine1 => const TextStyle(
        fontSize: 36,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 44 / 36,
        letterSpacing: 0,
      );

  TextStyle get materialThemeHeadLine2 => const TextStyle(
        fontSize: 32,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 40 / 32,
        letterSpacing: 0,
      );

  TextStyle get materialThemeHeadLine3 => const TextStyle(
        fontSize: 28,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 36 / 28,
        letterSpacing: 0,
      );

  TextStyle get materialThemeHeadLine4 => const TextStyle(
        fontSize: 24,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 32 / 24,
        letterSpacing: 0,
      );

  TextStyle get materialThemeHeadLine5 => const TextStyle(
        fontSize: 22,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 28 / 22,
        letterSpacing: 0,
      );

  TextStyle get materialThemeHeadLine6 => const TextStyle(
        fontSize: 18,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 24 / 18,
        letterSpacing: 0,
      );

  TextStyle get materialThemeSubHead1 => const TextStyle(
        fontSize: 16,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 24 / 16,
        letterSpacing: 0.1,
      );

  TextStyle get materialThemeSubHead2 => const TextStyle(
        fontSize: 14,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 20 / 14,
        letterSpacing: 0.1,
      );

  TextStyle get materialThemeButton => const TextStyle(
        fontSize: 14,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 20 / 14,
        letterSpacing: 0.1,
      );

  TextStyle get materialThemeBody1 => const TextStyle(
        fontSize: 16,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
        letterSpacing: 0.5,
      );

  TextStyle get materialThemeBody2 => const TextStyle(
        fontSize: 14,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 20 / 14,
        letterSpacing: 0.25,
      );

  TextStyle get materialThemeCaption => const TextStyle(
        fontSize: 12,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 16 / 12,
        letterSpacing: 0.4,
      );

  TextStyle get materialThemeOverLine => const TextStyle(
        fontSize: 12,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 16 / 12,
        letterSpacing: 0.5,
      );

  TextStyle get materialThemedIsPlayLarge => const TextStyle(
        fontSize: 57,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 64 / 57,
        letterSpacing: -0.25,
      );

  TextStyle get materialThemedIsPlayMedium => const TextStyle(
        fontSize: 45,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 52 / 45,
        letterSpacing: 0,
      );

  TextStyle get materialThemedIsPlaySmall => const TextStyle(
        fontSize: 36,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 44 / 36,
        letterSpacing: 0,
      );

  TextStyle get materialThemeHeadLineLarge => const TextStyle(
        fontSize: 32,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: AppColors.materialThemeSysLightOnSecondary,
        height: 40 / 32,
        letterSpacing: 0,
      );

  TextStyle get materialThemeHeadLineMedium => const TextStyle(
        fontSize: 28,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 36 / 28,
        letterSpacing: 0,
      );

  TextStyle get materialThemeHeadLineSmall => const TextStyle(
        fontSize: 24,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 32 / 24,
        letterSpacing: 0,
      );

  TextStyle get materialThemeTitleLarge => const TextStyle(
        fontSize: 22,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 28 / 22,
        letterSpacing: 0,
      );

  TextStyle get materialThemeTitleMedium => const TextStyle(
        fontSize: 16,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 24 / 16,
        letterSpacing: 0.1,
      );

  TextStyle get materialThemeTitleSmall => const TextStyle(
        fontSize: 14,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 20 / 14,
        letterSpacing: 0.1,
      );

  TextStyle get materialThemeLabelLarge => const TextStyle(
        fontSize: 14,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 20 / 14,
        letterSpacing: 0.1,
      );

  TextStyle get materialThemeLabelMedium => const TextStyle(
        fontSize: 12,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 16 / 12,
        letterSpacing: 0.5,
      );

  TextStyle get materialThemeLabelSmall => const TextStyle(
        fontSize: 11,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 16 / 11,
        letterSpacing: 0.5,
      );

  TextStyle get materialThemeBodyLarge => const TextStyle(
        fontSize: 16,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
        letterSpacing: 0.5,
      );

  TextStyle get materialThemeBodyMedium => const TextStyle(
        fontSize: 14,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 20 / 14,
        color: AppColors.materialThemeReadOnlyLightBlack,
        letterSpacing: 0.25,
      );

  TextStyle get materialThemeBodySmall => const TextStyle(
        fontSize: 12,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 16 / 12,
        letterSpacing: 0.4,
      );
}
