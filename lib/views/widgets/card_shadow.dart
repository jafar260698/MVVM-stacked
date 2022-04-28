/*
 * *
 *  * Created by Mahmud Nurmuhammedov on 4/28/21 12:38 PM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Last modified 4/28/21 12:38 PM
 *
 *
 */

import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class CardShadow extends StatelessWidget {
  final Widget? child;
  final Color? color;

  const CardShadow({Key? key, this.child, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      color: color ?? ThemeProvider.controllerOf(context).theme.data.cardColor,
      shadowColor: Colors.black26,
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: child,
    );
  }
}
