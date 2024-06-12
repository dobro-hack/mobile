import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class FontFamily {
  static const String roboto = 'Roboto';
  static const String vkSans = 'VK Sans Display';
}

class Roboto {
  TextStyle size15Weihtg400 = TextStyle(
    fontSize: 15.sp,
    height: 20 / 15,
    fontFamily: FontFamily.roboto,
  );
  TextStyle size13Weihtg400 = TextStyle(
    fontSize: 13.sp,
    height: 16 / 13,
    fontFamily: FontFamily.roboto,
  );
  TextStyle size16Weihtg400 = TextStyle(
    fontSize: 16.sp,
    height: 20 / 16,
    fontFamily: FontFamily.roboto,
  );
  TextStyle size14Weihtg400 = TextStyle(
    fontSize: 14.sp,
    height: 18 / 14,
    fontFamily: FontFamily.roboto,
  );
  TextStyle size16Weihtg500 = TextStyle(
    fontSize: 16.sp,
    height: 20 / 16,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.roboto,
  );
  TextStyle size15Weihtg500 = TextStyle(
    fontSize: 15.sp,
    height: 20 / 15,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.roboto,
  );
}

class Sans {
  TextStyle size16Weihtg500 = TextStyle(
    fontSize: 16.sp,
    height: 20 / 16,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.vkSans,
  );
  TextStyle size23Weihtg600 = TextStyle(
    fontSize: 23.sp,
    height: 28 / 23,
    fontWeight: FontWeight.w600,
    fontFamily: FontFamily.vkSans,
  );
  TextStyle size21Weihtg600 = TextStyle(
    fontSize: 21.sp,
    height: 26 / 21,
    fontWeight: FontWeight.w600,
    fontFamily: FontFamily.vkSans,
  );
}
