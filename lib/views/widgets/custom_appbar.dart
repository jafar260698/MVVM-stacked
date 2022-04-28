import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mock_app/views/theme/font_style.dart';
import '../../utils/strings.dart';

AppBar appBarPage({
  BuildContext? context,
  PreferredSizeWidget? bottom,
}) {
  return AppBar(
    elevation: 3.0,
    shadowColor: Colors.black45,
    centerTitle: true,
    title: Center(
      child: Text(
        Words.myDocument,
        style: FontStyle.appBarStyle,
      ),
    ),
    leading: Builder(
      builder: (context) {
        return InkWell(
          onTap: () => Scaffold.of(context).openDrawer(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 8.0),
            child: SvgPicture.asset(
                'assets/icons/menu.svg',
                height: 16,
                width: 24,
                color: Colors.white
            ),
          ),
        );
      },
    ),
    actions: [
      InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {

        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 20.0),
          child: SvgPicture.asset(
              'assets/icons/search.svg',
              color: Colors.white),
        ),
      ),
    ],
    bottom: bottom,
  );
}