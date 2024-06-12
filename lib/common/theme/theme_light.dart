import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

ThemeData themeLight = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.white,
  brightness: Brightness.light,
  dividerColor: AppColors.red,
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
  disabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.greyBorder),
      borderRadius: BorderRadius.all(Radius.circular(12.r))),
  enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.greyBorder),
      borderRadius: BorderRadius.all(Radius.circular(12.r))),
  focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.greyBorder),
      borderRadius: BorderRadius.all(Radius.circular(12.r))),
  errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.red),
      borderRadius: BorderRadius.all(Radius.circular(12.r))),
  focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.red),
      borderRadius: BorderRadius.all(Radius.circular(12.r))),
);

AppBarTheme _appBarTheme = AppBarTheme(
  centerTitle: false,
  foregroundColor: AppColors.black,
  backgroundColor: AppColors.white,
  iconTheme: const IconThemeData(color: AppColors.black),
  elevation: 0,
  titleSpacing: 0,
  titleTextStyle: Sans().size21Weihtg600.copyWith(color: AppColors.black),
);

ButtonStyle _elevButtonLight = ElevatedButton.styleFrom(
  // backgroundColor: AppColors.green,
  // foregroundColor: AppColors.white,
  shape:
      StadiumBorder(), //  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  textStyle: Roboto().size16Weihtg500,
);
