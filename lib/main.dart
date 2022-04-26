import 'package:flutter/material.dart';
import 'package:mock_app/screen/splash/splash_page.dart';
import 'package:mock_app/views/theme/my_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //     statusBarColor: Colors.grey
    // ));
    return MaterialApp(
      title: 'IJRO',
      theme: MyThemes.lightTheme,
      home: SplashScreen(),
    );
  }
}