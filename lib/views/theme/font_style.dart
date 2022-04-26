import 'package:flutter/material.dart';

import 'app_color.dart';


TextTheme textTheme = const TextTheme(
    headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff325ECD)),
    headline2: TextStyle(fontSize: 20, color: Color(0xff325ECD), fontWeight: FontWeight.w600),
    headline5: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    bodyText2: TextStyle(fontSize: 14.0));

class FontStyle {
  FontStyle._();


  static BorderRadiusGeometry topRadius = const BorderRadius.only(
      topLeft: Radius.circular(30.0),
      topRight: Radius.circular(30.0));

  static TextStyle appBarStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColor.primaryColor,
    letterSpacing: 0.1,
  );

  static TextStyle appBarStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColor.primaryColor,
    letterSpacing: 0.1,
  );

  static TextStyle headingColorStyle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: AppColor.primaryColor,
  );

  static TextStyle headline1 = const TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  static TextStyle titleStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle buttonNormal = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle listStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static TextStyle titleListGrey = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );

  static TextStyle title12 = const TextStyle(
    fontSize: 12,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w500,
  );

  static TextStyle subtitleList = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle titleListPrimary = const TextStyle(
    fontSize: 14,
    color: Colors.grey,
    fontWeight: FontWeight.w500,
  );

  static TextStyle title14 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle titleColor14 = TextStyle(
    fontSize: 14,
    color: AppColor.primaryColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle linkStyle = const TextStyle(
    fontSize: 14,
    color: Color(0xff333333),
    fontWeight: FontWeight.w500,
  );
}