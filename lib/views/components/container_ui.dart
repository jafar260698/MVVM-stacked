import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mock_app/views/theme/font_style.dart';

class ContainerUI extends StatelessWidget {
   const ContainerUI({
    this.fieldKey,
    this.labelText,
    this.icon,
    this.color
  });

  final Key? fieldKey;
  final Widget? icon;
  final Color? color;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {

      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(4.0, 11.0, 0, 11.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: CircleAvatar(
                    radius: 25,
                    backgroundColor: color,
                    child: icon ?? SvgPicture.asset(
                      "assets/svg/services/arrow_right.svg",
                      width: 12,
                      height: 8,
                      color: Colors.white,
                    )
                ),
              ),
              Expanded(
                child: Text(
                  labelText!,
                  style: FontStyle.appBarStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

