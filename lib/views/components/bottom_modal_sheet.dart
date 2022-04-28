import 'dart:io';

import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class BottomModalSheet extends StatelessWidget {
  const BottomModalSheet({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [_buildHandle(context), if (child != null) child!],
    );
  }

  Widget _buildHandle(BuildContext context) {
    final theme = Theme.of(context);
    return FractionallySizedBox(
      widthFactor: 0.25,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          height: 5.0,
          decoration: BoxDecoration(
            color: theme.dividerColor,
            borderRadius: const BorderRadius.all(Radius.circular(2.5)),
          ),
        ),
      ),
    );
  }
}