
import 'package:flutter/material.dart';
import 'package:mock_app/views/theme/app_color.dart';
import 'package:mock_app/views/theme/font_style.dart';

class DocumentUI extends StatelessWidget {
  const DocumentUI({
    this.labelText,
    this.numberText
  });

  final String? labelText;
  final String? numberText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {

      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text(
                labelText!,
                style: FontStyle.appBarStyle,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                border: Border.all(color: Colors.grey.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 3),
                child: Text(
                  numberText!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    letterSpacing: 0.1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
