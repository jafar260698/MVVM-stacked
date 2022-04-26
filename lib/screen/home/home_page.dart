

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:theme_provider/theme_provider.dart';
import '../../utils/device_size_config.dart';
import 'home_viewmodel.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var theme = ThemeProvider.controllerOf(context).theme.data;
    return ViewModelBuilder<HomeViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
          body: Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.calculateBlockVertical(20),
              left: SizeConfig.calculateBlockHorizontal(16),
              right: SizeConfig.calculateBlockHorizontal(16),
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onPanDown: (_) {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [

                  ],
                ),
              ),
            ),
          ),
        ),
        viewModelBuilder: () => HomeViewModel());
  }

}