import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mock_app/views/theme/app_color.dart';

enum MyThemeKeys { LIGHT, DARK }

const MaterialColor primary = MaterialColor(
  0xff325ECD,
  <int, Color>{
    50:   Color.fromRGBO(100, 90, 255, 1),
    100:  Color.fromRGBO(100, 90, 255, 1),
    200:  Color.fromRGBO(100, 90, 255, 1),
    300:  Color.fromRGBO(100, 90, 255, 1),
    400:  Color.fromRGBO(100, 90, 255, 1),
    500:  Color.fromRGBO(100, 90, 255, 1),
    600:  Color.fromRGBO(100, 90, 255, 1),
    700:  Color.fromRGBO(100, 90, 255, 1),
    800:  Color.fromRGBO(100, 90, 255, 1),
    900:  Color.fromRGBO(100, 90, 255, 1),
  },
);

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Montserrat',
    primarySwatch: primary,
    brightness: Brightness.light,
    primaryColorBrightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      color: Color(0xffF6F6FA),
    ),
    primaryColor: AppColor.primaryColor,
    backgroundColor: Color(0xffF6F6FA),
    scaffoldBackgroundColor: Color(0xffF6F6FA),
    cardColor: Color(0xffFFFFFF),
    focusColor: AppColor.primaryColor,
    bottomAppBarColor: AppColor.primaryColor,
    cupertinoOverrideTheme: const CupertinoThemeData(
      primaryColor: AppColor.primaryColor,
      textTheme: CupertinoTextThemeData(
        dateTimePickerTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    ),
    accentIconTheme: const IconThemeData(
      color: Color(0xff282F38),
    ),
    cursorColor: Color(0xff2E2F40),
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'Montserrat',
    primarySwatch: primary,
    brightness: Brightness.dark,
    primaryColorBrightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      color: Color(0xff17222C),
    ),
    primaryColor: Color(0xff325ECD),
    backgroundColor: Color(0xff17222C),
    scaffoldBackgroundColor: Color(0xff17222C),
    accentColor: Color(0xff325ECD),
    cardColor: Color(0xff253442),
    bottomSheetTheme: const BottomSheetThemeData(
      modalBackgroundColor: Color(0xff17222C),
    ),
    focusColor: const Color(0xff325ECD),
    cupertinoOverrideTheme: const CupertinoThemeData(
      barBackgroundColor: Color(0xff253442),
      textTheme: CupertinoTextThemeData(
        dateTimePickerTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    ),
    accentIconTheme: const IconThemeData(
      color: Color(0xffEFEFEF),
    ),
  );
}