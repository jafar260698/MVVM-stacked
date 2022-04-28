
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mock_app/views/theme/app_color.dart';
import 'package:mock_app/views/theme/font_style.dart';

class MainDashboardUI extends StatelessWidget {
  const MainDashboardUI({
    this.mainText,
    this.iconText,
    this.subTitle,
    this.date,
    this.color,
    this.icon
  });

  final String? mainText;
  final String? iconText;
  final String? subTitle;
  final String? date;
  final Color? color;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Text(
                  mainText!,
                  style: FontStyle.appBarStyle,
                ),
              ),
              Text(
                date!,
                style: FontStyle.titleListPrimary,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text(
                  subTitle!,
                  style: FontStyle.titleStyle,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        icon!,
                        width: 16,
                        height: 16,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        iconText!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          letterSpacing: 0.1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
