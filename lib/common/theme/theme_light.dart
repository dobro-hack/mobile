import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

ThemeData themeLight = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.white,
  brightness: Brightness.light,
  dividerColor: AppColors.greyMedium,
  elevatedButtonTheme: ElevatedButtonThemeData(style: _elevButtonLight),
  // disabledColor: AppColors.greyLight,
  appBarTheme: _appBarTheme,
  primaryColor: AppColors.black,
  primaryColorDark: AppColors.white,
  inputDecorationTheme: _inputDecorationTheme,
  // bottomNavigationBarTheme: _bottomNavigationBarThemeData,
  textTheme: _lightTextTheme,
  iconTheme: const IconThemeData(color: AppColors.greyDark),
  colorScheme: _colorScheme,
);

TextTheme _lightTextTheme = TextTheme(
  bodyMedium: Roboto().size15Weihtg400,
  bodySmall: Roboto().size13Weihtg400,
  bodyLarge: Roboto().size16Weihtg400,
  labelMedium:
      Roboto().size14Weihtg400.copyWith(color: AppColors.textGreySubtitle),
  labelSmall:
      Roboto().size13Weihtg400.copyWith(color: AppColors.textGreySecondary),
  labelLarge:
      Roboto().size16Weihtg400.copyWith(color: AppColors.textGreySecondary),
  headlineMedium: Roboto().size16Weihtg500,
  headlineSmall: Roboto().size15Weihtg500,
  titleMedium: Sans().size21Weihtg600,
  titleLarge: Sans().size23Weihtg600,
);

ColorScheme _colorScheme = ColorScheme.fromSwatch().copyWith(
  brightness: Brightness.light,
  onPrimary: AppColors.white,
  primary: AppColors.green,
  error: AppColors.red,
  onError: AppColors.white,
);

BottomNavigationBarThemeData _bottomNavigationBarThemeData =
    const BottomNavigationBarThemeData(
  elevation: 0,
  showSelectedLabels: false,
  showUnselectedLabels: false,
  type: BottomNavigationBarType.fixed,
  backgroundColor: AppColors.white,
  selectedItemColor: AppColors.greyDark,
  selectedIconTheme: IconThemeData(color: AppColors.white),
  unselectedItemColor: AppColors.white,
  unselectedIconTheme: IconThemeData(color: AppColors.greyDark),
);

InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: AppColors.greyBackgroundDark,
  suffixIconColor: AppColors.textGreySecondary,
  iconColor: AppColors.textGreySecondary,
  hintStyle:
      Roboto().size16Weihtg400.copyWith(color: AppColors.textGreySecondary),
  disabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.greyBorder),
      borderRadius: BorderRadius.all(Radius.circular(8))),
  enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.greyBorder),
      borderRadius: BorderRadius.all(Radius.circular(8))),
  focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.greyBorder),
      borderRadius: BorderRadius.all(Radius.circular(8))),
  errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.red),
      borderRadius: BorderRadius.all(Radius.circular(8))),
  focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.red),
      borderRadius: BorderRadius.all(Radius.circular(8))),
);

AppBarTheme _appBarTheme = const AppBarTheme(
  centerTitle: false,
  foregroundColor: AppColors.black,
  backgroundColor: AppColors.white,
  iconTheme: IconThemeData(color: AppColors.black),
  elevation: 0,
);

ButtonStyle _elevButtonLight = ElevatedButton.styleFrom(
  // backgroundColor: AppColors.green,
  // foregroundColor: AppColors.white,
  shape:
      StadiumBorder(), //  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  textStyle: Roboto().size16Weihtg500,
);
