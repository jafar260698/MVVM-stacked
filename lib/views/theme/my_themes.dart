import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum MyThemeKeys { LIGHT, DARK }

const MaterialColor primary = MaterialColor(
  0xff325ECD,
  <int, Color>{
    50:   Color(0xff325ECD),
    100:  Color(0xff325ECD),
    200:  Color(0xff325ECD),
    300:  Color(0xff325ECD),
    400:  Color(0xff325ECD),
    500:  Color(0xff325ECD),
    600:  Color(0xff325ECD),
    700:  Color(0xff325ECD),
    800:  Color(0xff325ECD),
    900:  Color(0xff325ECD),
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
    primaryColor: Color(0xff325ECD),
    accentColor: const Color(0xff325ECD),
    backgroundColor: Color(0xffF6F6FA),
    scaffoldBackgroundColor: Color(0xffF6F6FA),
    cardColor: Color(0xffFFFFFF),
    focusColor: Color(0xff325ECD),
    bottomAppBarColor: Color(0xff325ECD),
    cupertinoOverrideTheme: const CupertinoThemeData(
      primaryColor: Color(0xff325ECD),
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