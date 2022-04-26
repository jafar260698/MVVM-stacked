
import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mock_app/providers/router.gr.dart';
import 'package:mock_app/views/theme/app_color.dart';
import 'package:mock_app/views/theme/font_style.dart';
import '../../utils/device_size_config.dart';
import '../../utils/strings.dart';
import '../../views/widgets/logoWidget.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  startTime(bool success) async {
    var _duration = const Duration(seconds: 25);
    if (success) {
      return Timer(_duration, changeLanguageScreen);
    }
  }

  void changeLanguageScreen() async {
    context.router.replace(const HomePageRoute());
  }

  @override
  void initState() {
    super.initState();
    startTime(true);
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColor.splashBackground,
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SafeArea(
                child: Center(
                  child: getWidgetLogo,
                ),
              ),
              Text(
                Words.mainText,
                textScaleFactor: 1.0,
                textAlign: TextAlign.center,
                style: FontStyle.appBarStyle20,
              ),
              const SizedBox(height: 30),
              const CupertinoActivityIndicator(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                Words.copyright,
                textScaleFactor: 1.0,
                textAlign: TextAlign.center,
                style: FontStyle.title12,
              ),
            ),
          ),
        ],
      ),
    );
  }

}