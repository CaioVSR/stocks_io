import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppTextStyle {
  static TextStyle h1({Color color, FontWeight fontWeight}) => TextStyle(
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: 67.sp,
        color: color ?? AppColors.black30,
      );

  static TextStyle h2({Color color, FontWeight fontWeight}) => TextStyle(
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: 50.sp,
        color: color ?? AppColors.black30,
      );

  static TextStyle h3({Color color, FontWeight fontWeight}) => TextStyle(
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: 37.sp,
        color: color ?? AppColors.black30,
      );

  static TextStyle h4({
    Color color,
    FontWeight fontWeight,
  }) =>
      TextStyle(
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: 28.sp,
        color: color ?? AppColors.black30,
      );

  static TextStyle h5({Color color, FontWeight fontWeight}) => TextStyle(
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: 21.sp,
        color: color ?? AppColors.black30,
      );

  static TextStyle h6({Color color, FontWeight fontWeight}) => TextStyle(
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: 15.sp,
        color: color ?? AppColors.black30,
      );

  static TextStyle p({Color color, FontWeight fontWeight}) => TextStyle(
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: 12.sp,
        color: color ?? AppColors.black30,
      );

  static TextStyle small({Color color, FontWeight fontWeight}) => TextStyle(
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: 10.sp,
        color: color ?? AppColors.black30,
      );

  static TextStyle tiny({Color color, FontWeight fontWeight}) => TextStyle(
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: 8.sp,
        color: color ?? AppColors.black30,
      );
}
