import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:theme_provider/theme_provider.dart';
import '../../utils/device_size_config.dart';

class SelectUI extends StatelessWidget {
   const SelectUI({
    this.fieldKey,
    this.validator,
    this.text = "",
    this.isTextHas = true,
    this.isHint = false,
    this.controller,
    this.child,
    this.labelText,
    this.isSelected = true,
    this.isSubmitBtnClicked = false,
    this.isLoading = false,
    this.errorText = "Tanlash majburiy",
    this.color,
    this.isCustomColor = false,
    this.isScrollControlled = false,
  });

  final Key? fieldKey;
  final String? text;
  final String errorText;
  final bool isTextHas;
  final bool isSelected;
  final bool isHint;
  final bool isCustomColor;
  final bool isSubmitBtnClicked;
  final bool isLoading;
  final Widget? child;
  final Color? color;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final String? labelText;
  final bool isScrollControlled;

  @override
  Widget build(BuildContext context) {
    var theme = ThemeProvider.controllerOf(context).theme.data;
    return GestureDetector(
      onTap: () => {
        showModal(context, child),
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Visibility(
              visible: isTextHas,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  text!,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: theme.accentIconTheme.color),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(4.0, 11.0, 0, 11.0),
                decoration: BoxDecoration(
                  color: isCustomColor ? color : theme.cardColor,
                  border: Border.all(
                      color: isSubmitBtnClicked
                          ? isSelected
                              ? Colors.grey.withOpacity(0.5)
                              : Colors.red
                          : Colors.grey.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          labelText!,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: theme.accentIconTheme.color!
                                .withOpacity(isHint ? 0.3 : 1),
                          ),
                        ),
                      ),
                      isLoading
                          ? const CupertinoActivityIndicator()
                          : const Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: isSubmitBtnClicked && !isSelected,
                child: Padding(
                  padding: EdgeInsets.only(left: 8, top: 4),
                  child: Text(
                    errorText,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: SizeConfig.calculateTextSize(11),
                        fontWeight: FontWeight.w500,
                        color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showModal(context, Widget? child) {
    FocusScope.of(context).requestFocus(FocusNode());
    showMaterialModalBottomSheet(
      expand: false,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      builder: (context) {
        return  child!;
      },
    );
  }
}

